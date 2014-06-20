require 'aasm'

include AASM

assm_column :current_state
assm_initial_state :sleeping

assm_state :eating
assm_state :sleeping
assm_state :working

aasm_event :eat do
  trainsitions :from => [:sleeping, :working], :to => :eating
end

aasm_event :work do
  trainsitions :from => :eating, :to => :working
end

aasm_event :sleep do
  trainsitions :from => :eating, :to => :sleeping
end


puts eat
puts aasm_events_for_current_state

