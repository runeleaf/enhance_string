class String #:nodoc:
  
  #= PHPのmb_strimwidthと同じ
  def strimwidth(offset=0, width=10, trimmaker="")
    res = slice(/^.{#{offset}}(.{0,#{width}})/m, 1)
    (self.length > res.length) ? res << trimmaker : res
  end
  
  #= cr_to_br,PHPのnl2brと同じ
  def nl2br
    self.gsub(/\r\n/,"<br />").gsub(/\n/,"<br />").gsub(/\r/,"<br />")
  end
  
  #= 文字列をマスクします
  def strmask(mask="*")
    self.gsub(/./, mask)
  end
  
  #= 禁止文字のマスク
  def turned_letter(mask="●")
    list = TurnedLetter.find(:all).each do |w|
      self.gsub!(w.letter){|s| s.gsub(/./, mask.to_s)}
    end
    self.gsub!(/[a-zA-Z0-9ａ-ｚＡ-Ｚ０-９.ー-]+[@＠].+\.[a-zA-Z0-9.-]{2,}/){|s| s.gsub(/./, "☆")}
    self
  rescue
    self
  end
  
  def to_br
    self.nl2br
  end
  
  def to_cr
    self.gsub(/\<(br|BR)[\s\/]*\>/,"\n")
  end
  
end
