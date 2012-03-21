class EmailFormatValidator < ActiveModel::EachValidator


	def validate_each(record, attribute, value)



		format = /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/
		message = attribute.to_s.humanize + "doesn't match an acceptable format"
		record.errors[attribute] << (options[:message] || message) unless value =~ format

	end


end