#!/home/wasu/.rbenv/shims/ruby
key = ARGV[0]
md_files = ARGV[1..-1]
nippo_files = []
memo_files = []

md_files.each do |x|
  if x.match(/\d{4,4}-\d{2,2}-\d{2,2}\.md/)
    nippo_files.push(x)
  else
    memo_files.push(x)
  end
end

result = {}
memo_files.sort!{|a,b| a.size <=> b.size}
memo_files.reverse!

class Aggr
  attr_accessor :cols, :match_str
  def initialize(cols, match_str)
    @cols = cols
    @match_str = match_str
  end
  def cols_length
    @cols.map{|x| File.open(x).read }.map(&:length).sum
  end
  def to_ss
    "grp: #{@match_str}, cnt: #{@cols.size}, cols_length: #{self.cols_length}"
  end
  def to_s
    "#{self.to_ss}, #{@cols}"
  end
end

while memo_files.size > 0 do
  mfs = []
  match_str = memo_files[0][0..-6]
  grp = [memo_files[0]]
  memo_files[1..-1].each do |x|
    if x.match("^#{match_str}")
      grp.push(x)
    else
      mfs.push(x)
    end
  end
  result[match_str] = Aggr.new(grp, match_str)
  memo_files = mfs
end

result.sort{|a,b| a[1].cols.size <=> b[1].cols.size}.reverse.each do |x|
  puts x[1].to_ss
end
