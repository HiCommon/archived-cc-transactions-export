require 'csv'
require 'time'
csv = CSV.read("transactions.csv")
headers = csv.shift
date = Time.now.strftime("%m-%d-%Y")
csv.each do |row|
  first_name = row[35]
  last_name = row[36]
  group = csv.select do |row|
    row[35] == first_name && row[36] == last_name
  end
  CSV.open("transactions/#{first_name[0] + last_name}-#{date}.csv", "wb") do |new_csv|
    new_csv << headers
    group.each do |r|
      new_csv << r
    end
  end
end