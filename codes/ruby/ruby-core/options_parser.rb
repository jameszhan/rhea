
=begin
+--------------+
| OptionParser |<>-----+
+--------------+       |                      +--------+
                       |                    ,-| Switch |
     on_head -------->+---------------+    /  +--------+
     accept/reject -->| List          |<|>-
                      |               |<|>-  +----------+
     on ------------->+---------------+    %x-| argument |
                        :           :        |  class   |
                      +---------------+      |==========|
     on_tail -------->|               |      |pattern   |
                      +---------------+      |----------|
OptionParser.accept ->| DefaultList   |      |converter |
             reject   |(shared between|      +----------+
                      | all instances)|
                      +---------------+
=end
