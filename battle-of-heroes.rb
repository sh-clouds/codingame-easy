ROUND_START_STR = "Round %d\n"
ROUND_MID_STR = "----------\n"
ROUND_END_STR = "##########\n"
ACTION_STR = "%d %s(s) attack(s) %d %s(s) dealing %d damage\n%d unit(s) perish\n"
WIN_STR = "%s won! %d unit(s) left\n"

class Stack
  BUFF_LEN = 21

  attr_accessor :name, :amount, :health, :damage, :total

  def initialize
    input = gets.chomp
    @name, @amount, @health, @damage = input.split(';')
    @amount = @amount.to_i
    @health = @health.to_i
    @damage = @damage.to_i
    @total = @amount * @health
  end
end


turn = 0
stacks = Array.new(2) { Stack.new }

loop do
    turn += 1
    printf(ROUND_START_STR, turn)

    (0..1).each do |i|
        attacker = stacks[i % 2]
        defender = stacks[(i + 1) % 2]
        damage = attacker.amount * attacker.damage
        new_total = [0, defender.total - damage].max
        new_amount = (new_total.to_f / defender.health).ceil
        dead = [defender.amount, defender.amount - new_amount].min

        printf(ACTION_STR, attacker.amount, attacker.name, defender.amount, defender.name, damage, dead)
        printf("%s", (i == 0) ? ROUND_MID_STR : ROUND_END_STR)

        defender.amount = [0, defender.amount - dead].max
        defender.total = [0, defender.total - damage].max

        if defender.amount == 0
            printf(WIN_STR, attacker.name, attacker.amount)
            return
        end
    end
end

