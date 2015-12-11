class CreateEventJob
  @queue = :events
	def perform
		Event.create(title: 'Some BS event')
	end
end