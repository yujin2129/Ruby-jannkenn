#じゃんけんの開始処理
def start_jannkenn()
  puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
  me_hand = gets.to_i
  enemy_hand = rand(2)
  
  if me_hand == 0 || me_hand == 1 || me_hand == 2
    case me_hand
    when 0
      case enemy_hand
      when 0
        jannkenn_result = "draw"
      when 1
        jannkenn_result = "win"
      when 2
        jannkenn_result = "lose"
      end
    when 1
      case enemy_hand
      when 0
        jannkenn_result = "lose"
      when 1
        jannkenn_result = "draw"
      when 2
        jannkenn_result = "win"
      end
    when 2
      case enemy_hand
      when 0
        jannkenn_result = "win" 
      when 1
        jannkenn_result = "lose"
      when 2
        jannkenn_result = "draw"
      end
    end
    jannkennresult_show(me_hand,enemy_hand,jannkenn_result)
  elsif me_hand != 3
    puts "適切な数字を入力してください。"
    start_jannkenn
  end
end
#あっちむいてほいの開始処理
def start_attimuitehoi(pre_result)
  puts "あっちむいて..."
  puts "0(上) 1(右) 2(下) 3(左)"
  me_direction = gets.to_i
  enemy_direction = rand(3)

  if me_direction == 0 || me_direction == 1 || me_direction == 2 || me_direction == 3
    if me_direction == enemy_direction
      if pre_result == "win"
        match_result = "win"
      else
        match_result = "lose"
      end
      attimuitehoiresult_show(me_direction,enemy_direction,match_result)
    else
      match_result = ""
      attimuitehoiresult_show(me_direction,enemy_direction,match_result)
      puts "最初はグー、じゃんけん..."
      start_jannkenn
    end
  else
    puts "適切な数字を入力してください。"
    start_attimuitehoi(pre_result)
  end
end
#じゃんけんの結果表示処理
def jannkennresult_show(me,enemy,result)
  me = hand_changeword(me)
  enemy = hand_changeword(enemy)
  show_word = result_changeword(result)
  puts "-----------------------------"
  puts "あなたの手は#{me}です。"
  puts "相手の手は#{enemy}です。"
  puts "結果：#{show_word}です。"
  puts "-----------------------------"

  if result == "win" || result == "lose"
    start_attimuitehoi(result)
  else
    puts "あいこで..."
    start_jannkenn
  end
end
#あっちむいてほいの結果表示処理
def attimuitehoiresult_show(me,enemy,result)
  me = direction_changeword(me)
  enemy = direction_changeword(enemy)
  puts "-----------------------------"
  puts "あなたの向きは#{me}です。"
  puts "相手の向きは#{enemy}です。"
  if result == "win" || result == "lose"
    show_word = result_changeword(result)
    puts "結果：#{show_word}です。"
    puts "-----------------------------"
  else
    puts "-----------------------------"
  end
end
#手の文字変換処理
def hand_changeword(hand_word)
  case hand_word
  when 0
    hand_word = "グー"
  when 1
    hand_word = "チョキ"
  when 2
    hand_word = "パー"
  end
  return hand_word
end
#向きの文字変換処理
def direction_changeword(direction_word)
  case direction_word
  when 0
    direction_word = "上"
  when 1
    direction_word = "右"
  when 2
    direction_word = "下"
  when 3
    direction_word = "左"
  end
  return direction_word
end
#結果の文字変換処理
def result_changeword(result_word)
  case result_word
  when "win"
    result_word = "あなたの勝ち"
  when "lose"
    result_word = "あなたの負け"
  when "draw"
    result_word = "引き分け"
  end
  return result_word
end

puts "最初はグー、じゃんけん..."
start_jannkenn
puts "処理を終了します"