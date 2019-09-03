class Bottles
  def verse(number)
    build_verse(number)
  end

  def verses(beginning, ending)
    beginning.downto(ending).map { |n| build_verse(n) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def build_verse(number)
    build_first_line(number) + build_last_line(number)
  end

  def build_first_line(number)
    bottles = inflect_bottles(number)

    "#{bottles.capitalize} of beer on the wall, #{bottles} of beer.\n"
  end

  def build_last_line(number)
    last_line_a(number) + last_line_b(number)
  end

  def last_line_a(number)
    if number.zero?
      'Go to the store and buy some more,'
    else
      bottle_reference = number == 1 ? 'it' : 'one'
      "Take #{bottle_reference} down and pass it around,"
    end
  end

  def last_line_b(number)
    number = 100 if number.zero?# Stringer, time to re-up

    " #{inflect_bottles(number-1)} of beer on the wall.\n"
  end

  def inflect_bottles(number)
    case number
    when 0 then 'no more bottles'
    when 1 then '1 bottle'
    else "#{number} bottles"
    end
  end
end
