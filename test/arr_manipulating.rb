a = ["person_1", "person_2", "person_37", "person_152", "person_7", "person_79", "person_15225", "person_71", "person_749", "person_15", "person_7659", "person_6", "person_4", "person_78", "person_89"]

def sort_stringifyed_numbers_array(arr)
    configured = []
    final = []

    arr.map do |el|
        b = el.split('_')
        c = b[1].to_i
        configured.push(c)
    end

    configured = configured.sort

    configured.map do |e|
        final.push("person_"+e.to_s)
    end

    return p final
end

sort_stringifyed_numbers_array(a)

