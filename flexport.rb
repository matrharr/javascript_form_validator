# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(s)
  arr = [s].map{|a| a.split(/[\n ,]+/) }
  arr.flatten!
  
  duration_hash = {}
  
  payment_hash = {}
  arr.each_with_index do |item, index|
    if index % 2 != 0
      phone_number = item
      # convert time
      temp = arr[index-1]
      time = (temp[3..4].to_i * 60) + temp[6..7].to_i
    
    
    # setting/summing duration per phone
    if duration_hash[phone_number]
      duration_hash[phone_number] += time
    else
      duration_hash[phone_number] = time
    end
    
    # convert time
    
    minutes = temp[3..4].to_i
    seconds = temp[6..7].to_i
    
    # calculate cost of call
    if minutes < 5
      total_seconds = (minutes * 60) + seconds
      total_cost = (total_seconds * 3)
    elsif minutes >= 5
    # new minute
      if seconds > 0
        minutes += 1
      end
      total_cost = (minutes * 150)
    end
    
    # setting/summing payment per phone
    if payment_hash[phone_number] 
      payment_hash[phone_number] += total_cost
    else
      payment_hash[phone_number] = total_cost
    end
  end
  end
  
  # determine free number
  longest_duration_hash = {}
  duration_hash.each do |key, value|
    current_top = 0
    
    if value > current_top
      new_hash = {key => value}
      longest_duration_hash = new_hash
      current_top = value
    elsif value >= current_top
      longest_duration_hash[key] = value
    end
  end
  
  new_hash = {}
  # if there is a tie
  if longest_duration_hash.size > 1
    # convert str num to sum
    longest_duration.each do |number_str, value|
      array = number_str.split('')
      array.map do |str|
        if str != '-'
          str = str.to_i
        end
      end
      phone_sum = array.inject(&:+)
      new_hash[number_str] = phone_sum
    end
    
    longest_duration.keys.each do |phone_num|
      winner = ''
      largest = 0
      if new_hash[phone_num] > largest
        winner = phone_num
      end
    end
    return payment_hash[winner]
  else
    return payment_hash[longest_duration_hash.keys[0]]
    
  end
  
  
end