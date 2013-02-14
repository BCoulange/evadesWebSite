# encoding: utf-8
class MailingImporter

	require 'csv' 

	# Import des adresses CSV
	def self.importemails(csv_text)
		emails = []
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
			emails << row[14]
		end

		return emails
	end


end