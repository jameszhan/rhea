require 'tk'

b = TKButton.new(text: "hello").pack
b.command{puts "hello"}
Tk.mainloop