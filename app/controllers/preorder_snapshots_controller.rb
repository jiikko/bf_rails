class PreorderSnapshotsController < ApplicationController
  def index
    @snapshots = PreorderSnapshot.summary.order(id: :desc).page(params[:page]).select(:restored)
  end

  def new
    @snapshot = PreorderSnapshot.new
  end

  def show
    @snapshot = PreorderSnapshot.find(params[:id])
    @preorders = @snapshot.preorders.order(id: :desc)
  end

  def create
    @snapshot = PreorderSnapshot.new(preorder_snapshot_params)
    if @snapshot.save
      @snapshot.export_from_bf!
      redirect_to preorder_snapshots_path, notice: 'BFサーバから注文を取得することに成功しました'
    else
      render :new
    end
  end

  def import_to_bf
    unless PreorderSnapshot.order_empty?
      redirect_to preorder_snapshot_path(params[:id]), flash: { error: 'すでに注文が登録されているので処理を中止しました' }
      return
    end

    PreorderSnapshot.find(params[:id]).import_to_bf!
    redirect_to preorder_snapshot_path(params[:id]), notice: 'BFサーバから注文の反映に成功しました'
  end

  private

  def preorder_snapshot_params
    params.fetch(:preorder_snapshot).permit!
  end
end
