module TableMacher
  # テーブルタグをパースして、下記と同じ構造であることを確認するマッチャー
  # | name   |
  # | やまだ |

  # TODO エラー時の出力
  def table_macher(selector)
    table = Nokogiri.parse(response.body).search(selector).first
    yield.split("\n").each_with_index do |line, index|
      line.split(/\|/).reject(&:blank?).map{ |x| x.remove(' ') }.each_with_index do |keyword, iindex|
        expect(table.children[index].children[iindex].to_html).to include(keyword)
      end
    end
  end
end
