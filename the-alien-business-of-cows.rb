
COLLECTORS = [
    {
        name: 'VaCoWM Cleaner',
        speed: 44.7,
        capacity: 3,
        min: 1,
        efficiency: 0.85
    },
    {
        name: 'L4nd MoWer',
        speed: 22.38,
        capacity: 10,
        min: 6,
        efficiency: 1.2
    },
    {
        name: 'Cow Harvester',
        speed: 11.19,
        capacity: 20,
        min: 14,
        efficiency: 1.5
    }
]

def str2_deg(coord)
    degs, rest = coord.split('°')
    mins, secs = rest.split("'")
    return degs.to_f + mins.to_f / 60 + secs.to_f / 3600
end

BASE = { lat: str2_deg("34°45'21.8"), long: str2_deg("120°37'34.8"), elevation: 46 }
CAPTURE_TIME = 500.0 / 9.81  # seconds per cow

num_entries = gets.to_i
num_entries.times do
    entry = gets.strip
    if match = entry.match(/^(.+) (\d{2,3}°\d{2}'\d{2}\.\d)"N (\d{2,3}°\d{2}'\d{2}\.\d)"W (\d+)$/)
        name, lat_str, long_str, elevation = match.captures
        lat = str2_deg(lat_str)
        long = str2_deg(long_str)

        d_lat = (lat - BASE[:lat]).abs * 111110
        d_long = (long - BASE[:long]).abs * 111110 * Math.cos((lat + BASE[:lat]) * Math::PI / 360)
        d_elev = 160000 - BASE[:elevation]
        dist = Math.sqrt(d_lat**2 + d_long**2 + d_elev**2)
        time_to_escape = dist / 6000

        best_collector = { cows: 0 }
        COLLECTORS.each do |collector|
            time_to_take_off = (160000 - 500 - elevation.to_i) / (collector[:speed] * 1000)
            next if time_to_take_off >= time_to_escape

            possible_nb_cows = ((time_to_escape - time_to_take_off) / (CAPTURE_TIME / collector[:efficiency])).to_i
            next if possible_nb_cows < collector[:min]

            nb_cows = [possible_nb_cows, collector[:capacity]].min
            if nb_cows > best_collector[:cows]
                best_collector = collector.merge(cows: nb_cows)
            end
        end

        if best_collector[:cows].zero?
            puts "#{name}: impossible."
        else
            puts "#{name}: possible. Send a #{best_collector[:name]} to bring back #{best_collector[:cows]} cow#{'s' unless best_collector[:cows] == 1}."
        end
    end
end