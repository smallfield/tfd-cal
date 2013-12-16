# coding:utf-8
LIST={0=>["週休", "非番", "当番"], 1=>["当番", "週休", "非番"], 2=>["非番", "当番", "週休"], 3=>["日勤", "非番", "当番"], 4=>["週休", "当番", "非番"], 5=>["週休", "非番", "当番"], 6=>["当番", "週休", "非番"], 7=>["非番", "当番", "週休"], 8=>["週休", "非番", "当番"], 9=>["当番", "週休", "非番"], 10=>["非番", "当番", "日勤"], 11=>["当番", "非番", "週休"], 12=>["非番", "当番", "週休"], 13=>["週休", "非番", "当番"], 14=>["当番", "週休", "非番"], 15=>["非番", "当番", "週休"], 16=>["週休", "非番", "当番"], 17=>["当番", "日勤", "非番"], 18=>["非番", "週休", "当番"], 19=>["当番", "週休", "非番"], 20=>["非番", "当番", "週休"]}

  module CalHelper
    def getCycle bu, unixtime
      idx = (unixtime / 24 / 60 / 60 - 19) % 21
      LIST[idx][bu - 1]
    end

    def getCycleCal bu, unixtime
      data = getCycle bu.to_i, unixtime
      return "" unless data
      dtstart = Time.at(unixtime).strftime("%Y%m%d")
      dtend = Time.at(unixtime+24*60*60).strftime("%Y%m%d")
      return <<EOS
BEGIN:VEVENT
UID:#{unixtime}
DTSTART;VALUE=DATE:#{dtstart}
DTEND;VALUE=DATE:#{dtend}
SUMMARY:#{data}
END:VEVENT
EOS
    end

  end
