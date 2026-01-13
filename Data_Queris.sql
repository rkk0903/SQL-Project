# 1 TOTAL SEATS
 SELECT DISTINCT COUNT(parliament_constituency) AS TOTAL_SEATS FROM constituency_results;
 
 
# (2) What is the total number of seats available for elections in each state
SELECT S.State as State_Name,COUNT(CR.Parliament_constituency) as TOTAL_SEATS FROM Constituency_results CR 
INNER JOIN Statewise_results SR 
ON CR.Parliament_constituency = SR.Parliament_constituency
INNER JOIN States S 
ON SR.State_id = S.State_id
GROUP BY S.State order by count(CR.parliament_constituency) desc;


# (3) Total Seats Won by NDA Allianz ( CASE FUNCTION)
 SELECT 
    SUM(CASE 
            WHEN party IN (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            ) THEN Won
            ELSE 0 
        END) AS NDA_Total_Seats_Won
FROM 
    partywise_results;


                
# (4) SHOW ME HOW MANY SEAT WON BY THE EACH PARTY FROM NDA ALLIANCE AND ALSO SHOW IN PERCENTAGE CONTRIBUTION IN EACH PARTY ( Window fuction)
select party ,sum(won) as NDA_won_seat ,Round(sum(won)/sum(sum(won))Over()*100,2) as Seat_Percentage from partywise_results 
where party in (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM') group by party order by seat_percentage desc;
                
                
                
# (5) Total Seats Won by I.N.D.I.A. Allianz
SELECT 
    SUM(CASE 
            WHEN party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) THEN Won
            ELSE 0 
        END) AS INDIA_Total_Seats_Won
FROM 
    partywise_results;



# (6) SHOW ME HOW MANY SEAT WON BY THE EACH PARTY FROM INDIA ALLIANCE AND ALSO SHOW IN PERCENTAGE CONTRIBUTION IN EACH PARTY ( Window fuction)             
SELECT Party,sum(won) as won ,Round(sum(won)/sum(sum(won))Over()*100,2) as Seat_Percentage from Partywise_results 
where party in ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK') group by party order by Seat_percentage desc;
			
            

# (7) Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER (WINDOW)
SELECT Party,sum(won) as won ,Round(sum(won)/sum(sum(won))Over()*100,2) as Seat_Percentage,CASE WHEN PARTY IN ('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM') THEN 'N.D.A'
                WHEN PARTY IN ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK') THEN 'I.N.D.I.A' ELSE 'OTHER_PARTY'
                  END AS ALLIANCE FROM PARTYWISE_RESULTS GROUP BY PARTY ORDER BY WON DESC;
                  
                  
                  
# (8) Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER              
ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50);
UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);
UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);
UPDATE partywise_results
SET party_alliance = 'OTHER_PARTY'
WHERE party_alliance is null;

set sql_safe_updates = 0;
SELECT*FROM PARTYWISE_RESULTS ORDER BY WON DESC;


# (9) Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?
SELECT cr.Winning_Candidate, pr.party,pr.Party_Alliance, cr.Total_votes, cr.Margin,cr.Constituency_name ,s.state from Constituency_results cr
INNER JOIN Partywise_results pr
on cr.Party_id = pr.Party_id
INNER JOIN statewise_results sr
on cr.parliament_constituency = sr.parliament_constituency
INNER JOIN States s
on sr.state_id = s.state_ID
where constituency_name in ('etah') 
order by total_votes desc;


# (10) Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?
SELECT PARTY_ALLIANCE ,SUM(WON) AS WON FROM PARTYWISE_RESULTS
WHERE party_alliance in ('NDA','I.N.D.I.A','OTHER') GROUP BY 
PARTY_ALLIANCE ORDER BY WON DESC;


# (11) What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
select cd.candidate,cd.party, cd.evm, cd.Postal_Votes, cr.Constituency_Name from Constituency_results cr
INNER JOIN constituencywise_details cd
on cr.CONSTITUENCY_ID = cd.Constituency_ID
WHERE cr.Constituency_Name = 'ETAH';


# (12) Which parties won the most seats in s State, and how many seats did each party win?
SELECT PR.PARTY,count(pr.won) as seats_won,S.state FROM Partywise_results pr
INNER JOIN Constituency_RESULTS cr
on pr.Party_ID = cr.Party_ID
INNER JOIN statewise_results sr
on sr.Parliament_Constituency = cr.parliament_constituency
INNER JOIN states s
on s.state_id = sr.state_id
where S.STATE in ('uttar pradesh') group by pr.won,pr.party,s.state order by seats_won desc;



#(13) Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?
select cr.winning_candidate,p.party,p.party_alliance,cr.total_votes,cr.margin as margin_victory,s.state,cr.constituency_name 
from constituency_results cr
JOIN partywise_results p 
ON cr.Party_ID = p.Party_ID
INNER JOIN statewise_results sr
on cr.Parliament_constituency = sr.Parliament_Constituency
INNER JOIN States s 
on s.state_ID = sr.state_id 
where S.State = 'delhi' and cr.Constituency_Name = 'westdelhi';


#(14) What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024
select s.state AS STATE_NAME,
SUM(CASE WHEN PR.PARTY_ALLIANCE = 'NDA'THEN 1 ELSE 0 END) AS NDA_SEAT_WON, 
 SUM(CASE WHEN PR.PARTY_ALLIANCE = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_SEAT_WON,
 SUM(CASE WHEN PR.PARTY_ALLIANCE = 'OTHER_PARTY' THEN 1 ELSE 0 END) AS OTHER_PARTY_WON from Partywise_results pr 
INNER JOIN constituency_results cr 
on pr.party_id = cr.Party_id 
INNER JOIN statewise_results sr 
on cr.Parliament_constituency = sr.Parliament_Constituency
right JOIN states s 
on s.State_ID = sr.State_ID
WHERE PR.Party_ALLIANCE IN ('NDA','I.N.D.I.A','OTHER_PARTY')
group by s.state  order by S.STATE desc;

# (15) Which candidate received the highest number of EVM votes in each constituency (Top 10)?
SELECT cd.Candidate,cd.EVM,cr.Constituency_Name, cr.constituency_id FROM Constituency_RESULTS cR
left JOIN Constituencywise_details cd
on cd.constituency_id = cr.constituency_id
WHERE cd.EVM = (select max(cd1.evm) from constituencywise_details cd1 where cd1.constituency_id = cd.constituency_id ) order by cd.evm desc limit 10;

# Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?
select cr.winning_candidate,sr.trailing_candidate as runner_up,cr.constituency_name,s.state from statewise_results sr 
INNER JOIN constituency_results cr 
on cr.Parliament_constituency = sr.Parliament_Constituency
INNER JOIN states s 
on s.State_ID = sr.State_ID
where constituency_name = 'southdelhi';


SELECT 
    COUNT(DISTINCT cr.Constituency_ID) AS Total_Seats,
    COUNT(DISTINCT cd.Candidate) AS Total_Candidates,
    COUNT(DISTINCT p.Party) AS Total_Parties,
    SUM(cd.EVM + cd.Postal_Votes) AS Total_Votes,
    SUM(cd.EVM) AS Total_EVM_Votes,
    SUM(cd.Postal_Votes) AS Total_Postal_Votes
FROM 
    constituency_results cr
JOIN 
    constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
    s.State = 'Maharashtra';

