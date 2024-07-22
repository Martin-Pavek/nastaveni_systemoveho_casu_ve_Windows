cls
<# musi bejt spusteno v rezimu administrator
nastavi systemovy cas podle pipnuti v radiu pred zpravama treba na CR-plus
je to pro pocitac ktery je dlouho offline a proto nema kontrolu nastaveni casu z internetu
a po case se hodiny zacnou rozchazet, takze nastvi na vterinu presne na vterinu
#>

Remove-Variable volba -ErrorAction Ignore
Remove-Variable nastav -ErrorAction Ignore

$poc = 1
echo "vyber cemu je cas nejblize"
$pole_casy=@("", "5:00", "5:30", "6:00", "6:30", "7:00", "7:30", "8:00", "8:30", "9:00", "9:30", "10:00", "10:30", "11:00", "11:30")
$pole_casy+=@("12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "!5:30", "16:00", "16:30", "17:00", "17:30" ,"18:00")
$pole_casy+=@("18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "21:30", "22:00", "22:30", "23:00", "23:30", "00:00" ,"00:30")
$pole_casy+=@("01:00", "01:30", "02:00", "02:30", "03:00", "03:30", "04:00", "04:30")

$d_pole_casy = $pole_casy.Length -1

for ($aa = 1; $aa -le $d_pole_casy; $aa ++) {

$out_1 = ""
$out_1 += $aa
$out_1 += ") "
$out_1 += $pole_casy[$aa]
echo $out_1
#echo $pole_casy[$aa]
$poc++
}

[int32] $volba = Read-Host "vyber 1 -"$d_pole_casy" ?"
#echo $volba.GetType()

if (( $volba -lt 1 ) -or ( $volba -gt $d_pole_casy )) { # musi bej "))"
echo "chyba zadani"
sleep 3
exit 1
}

echo $volba
# samotne nastavenio casu ( rezin administrator !!! )

echo "puvodni cas:"
Get-Date
[string] $nastav = ""
$nastav += $pole_casy[$volba]
#echo $nastav.GetTypeCode()

echo "po zmacknuti nejake klavesy nastavim cas presne na "$pole_casy[$volba]
pause # zavola normalne systemovej prikaz pause
#Set-Date -Date "5:46"
#Set-Date $pole_casy[$volba]
Set-Date $nastav
echo "nastaven novy cas:"
sleep 5

