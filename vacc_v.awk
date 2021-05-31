# requires GNU AWK

BEGIN {
OFS=","
VACCIN      = 2
JOUR        = 3
N_CUM_DOSE1 = 6
N_CUM_DOSE2 = 7
PROCINFO["sorted_in"] = "@ind_str_asc"
}

NR == 1 {  # skip headers
	next
}

# 0 : Tous vaccins
# 1 : COMIRNATY Pfizer/BioNTech
# 2 : Moderna
# 3 : AstraZeneka
# 4 : Janssen
$VACCIN > 0 {  # skip "Tous vaccins"
	D[$JOUR]["d1"]["v" $VACCIN] = $N_CUM_DOSE1
	D[$JOUR]["d2"]["v" $VACCIN] = $N_CUM_DOSE2
}

END {
	print "day", "d1_v1", "d1_v2", "d1_v3", "d1_v4", "d2_v1", "d2_v2", "d2_v3", "d2_v4"
	for (d in D) {
		print d, D[d]["d1"]["v1"], D[d]["d1"]["v2"], D[d]["d1"]["v3"], D[d]["d1"]["v4"], \
		         D[d]["d2"]["v1"], D[d]["d2"]["v2"], D[d]["d2"]["v3"], D[d]["d2"]["v4"]
	}
}