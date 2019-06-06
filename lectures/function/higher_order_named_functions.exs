defmodule Util do
  def compose(data, outer_fun, inner_fun) do
    outer_fun.(inner_fun.(data))
  end
end

paragraph = """
In the United States, Election Day is the day set by law for the general
elections of federal public officials. It is statutorily set as the Tuesday next
after the first Monday in the month of November or the first Tuesday after
November 1. The earliest possible date is November 2, and the latest possible
date is November 8.  
"""

word_count = Util.compose(paragraph, &length/1, &String.split/1)

IO.puts(word_count)