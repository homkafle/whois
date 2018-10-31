#!/bin/bash
#A script to gather whois record of a provided domain and parse it "
#Author: Hom Kafle
#October 18,2018

#Usage: ./whois.sh example.com 


 echo "
********************************************************************
         _                                                   
        | |         o                                        
        | |     __      ,       _   __,   ,_    ,   _   ,_   
|  |  |_|/ \   /  \_|  / \_   |/ \_/  |  /  |  / \_|/  /  |  
 \/ \/  |   |_/\__/ |_/ \/    |__/ \_/|_/   |_/ \/ |__/   |_/
                             /|                              
                             \|                              
********************************************************************
"
echo "Fetching Registrar server record ..."
var=`whois $1 | grep 'Registrar WHOIS Server:' | head -n1 | awk '{print $4'}`

if [ $var ]; then
        echo "Registrar server found:"$var
        echo "Fetching Records from found registrar server "$var " ..."
        record=$(whois -h $var $1)
else
        echo "Fetching Records from the default whois server..."
        record=$(whois $1)
fi

echo "$record" > /tmp/$USER.tmp

#echo "$record" This will display all the record

echo ""
echo "-----------------------DOMAIN INFORMATION-------------------"

domainname=$(grep 'Domain Name:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Domain :" $domainname
registrar=$(grep 'Registrar:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Registrar :" $registrar
registeredon=$(grep 'Creation Date:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Registerd On :" $registeredon
expireson=$(grep 'Registrar Registration Expiration Date:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Expires On :" $expireson
updatedon=$(grep 'Updated Date:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Updated On :" $updatedon
status=$(grep 'Domain Status:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Status :"
echo "$status"
nameservers=$(grep 'Name Server:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Name Servers :"
echo "$nameservers"
echo ""
echo "-----------------------REGISTRANT CONTACT-------------------"

rname=$(grep 'Registrant Name:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Name :" $rname
rorg=$(grep 'Registrant Organization:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Organization :" $rorg
rstreet=$(grep 'Registrant Street:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Street :" $rstreet
rcity=$(grep 'Registrant City:' /tmp/$USER.tmp| cut -d: -f2-)
echo "City :" $rcity
rstate=$(grep 'Registrant State/Province:' /tmp/$USER.tmp| cut -d: -f2-)
echo "State :" $rstate
rcode=$(grep 'Registrant Postal Code:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Postal Code :" $rcode
rcountry=$(grep 'Registrant Country:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Country :" $rcountry
rphone=$(grep 'Registrant Phone:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Phone :" $rphone
rfax=$(grep 'Registrant Fax::' /tmp/$USER.tmp| cut -d: -f2-)
echo "Fax :" $rfax
remail=$(grep 'Registrant Email:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Email :" $remail
echo ""
echo "-----------------------ADMINISTRATIVE CONTACT---------------"

aname=$(grep 'Registrant Name:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Name :" $aname
aorg=$(grep 'Admin Organization:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Organization :" $aorg
astreet=$(grep 'Admin Street:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Street :" $astreet
acity=$(grep 'Admin City:' /tmp/$USER.tmp| cut -d: -f2-)
echo "City :" $acity
astate=$(grep 'Admin State/Province:' /tmp/$USER.tmp| cut -d: -f2-)
echo "State :" $astate
acode=$(grep 'Admin Postal Code:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Postal Code :" $acode
acountry=$(grep 'Admin Country:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Country :" $acountry
aphone=$(grep 'Admin Phone:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Phone :" $aphone
afax=$(grep 'Admin Fax::' /tmp/$USER.tmp| cut -d: -f2-)
echo "Fax :" $afax
aemail=$(grep 'Admin Email:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Email :" $aemail
echo ""
echo "-----------------------TECHNICAL CONTACT--------------------"

tname=$(grep 'Tech Name:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Name :" $tname
torg=$(grep 'Tech Organization:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Organization :" $torg
tstreet=$(grep 'Tech Street:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Street :" $astreet
tcity=$(grep 'Tech City:' /tmp/$USER.tmp| cut -d: -f2-)
echo "City :" $acity
tstate=$(grep 'Tech State/Province:' /tmp/$USER.tmp| cut -d: -f2-)
echo "State :" $tstate
tcode=$(grep 'Tech Postal Code:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Postal Code :" $tcode
tcountry=$(grep 'Tech Country:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Country :" $tacountry
tphone=$(grep 'Tech Phone:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Phone :" $tphone
tfax=$(grep 'Tech Fax::' /tmp/$USER.tmp| cut -d: -f2-)
echo "Fax :" $tfax
temail=$(grep 'Tech Email:' /tmp/$USER.tmp| cut -d: -f2-)
echo "Email :" $temail
echo "------------------------------------------------------------"

