#!/bin/bash

heroes=("antimage" "axe" "bane" "bloodseeker" "crystal_maiden" "drow_ranger" "earthshaker" "juggernaut" "mirana" "nevermore" "morphling" "phantom_lancer" "puck" "pudge" "razor" "sand_king" "storm_spirit" "sven" "tiny" "vengefulspirit" "windrunner" "zuus" "kunkka" "lina" "lich" "lion" "shadow_shaman" "slardar" "tidehunter" "witch_doctor" "riki" "enigma" "tinker" "sniper" "necrolyte" "warlock" "beastmaster" "queenofpain" "venomancer" "faceless_void" "skeleton_king" "death_prophet" "phantom_assassin" "pugna" "templar_assassin" "viper" "luna" "dragon_knight" "dazzle" "rattletrap" "leshrac" "furion" "life_stealer" "dark_seer" "clinkz" "omniknight" "enchantress" "huskar" "night_stalker" "broodmother" "bounty_hunter" "weaver" "jakiro" "batrider" "chen" "spectre" "doom_bringer" "ancient_apparition" "ursa" "spirit_breaker" "gyrocopter" "alchemist" "invoker" "silencer" "obsidian_destroyer" "lycan" "brewmaster" "shadow_demon" "lone_druid" "chaos_knight" "meepo" "treant" "ogre_magi" "undying" "rubick" "disruptor" "nyx_assassin" "naga_siren" "keeper_of_the_light" "wisp" "visage" "slark" "medusa" "troll_warlord" "centaur" "magnataur" "shredder" "bristleback" "tusk" "skywrath_mage" "abaddon" "elder_titan" "legion_commander" "ember_spirit" "earth_spirit" "abyssal_underlord" "terrorblade" "phoenix" "techies" "oracle" "winter_wyvern" "arc_warden")

# Function to count occurrences for each value in a column
count_values() {
    hero=$1
    column=$2
    file=$3
    region_file=$4
    output_file="heroes_count.txt"

    # Count occurrences of 1 or -1 in the specified column
    count=$(awk -F, -v col="$column" '{if ($col == 1 || $col == -1) count++} END {print count}' "$file")

    # If count is not a valid integer, set count to 0
    if ! [[ "$count" =~ ^[0-9]+$ ]]; then
        count=0
    fi

    echo "Region: $region_file Hero: $hero Count: $count" >> "$output_file"

    echo "------------------------" >> "$output_file"
}

# Function to process a region file
process_region_file() {
    region_file=$1

    # Create a count for each hero in the specified region file
    for ((i=0; i<${#heroes[@]}; i++)); do
        count_values "${heroes[i]}" "$((i+5))" "$region_file" "$region_file"
    done

    echo "Counts for each hero in $region_file have been written to heroes_count.txt"
}

# Example usage: process_region_file "US_West.txt"
for region_file in US_West.txt US_East.txt China.txt Russia.txt Europe_West.txt Europe_East.txt South_America.txt South_Korea.txt South_Africa.txt Chile.txt Peru.txt Southeast_Asia.txt India.txt Australia.txt; do
    process_region_file "$region_file"
done