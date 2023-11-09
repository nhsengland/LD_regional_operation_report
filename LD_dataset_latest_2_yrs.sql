--  sql for LD rpt


SELECT distinct
timeperiod
,los.[UniqueID]
	  ,[AgeAtPeriodEnd]
      ,[Gender]
      ,[EthnicCategory]
	  ,ccgorsc
	  ,sitename
	  ,case 
		when TimePeriod between los.EpisodeStartDate and los.EpisodeEndDate then 1
		else 0
		end as imp_flag

      ,[SpellStartDate]
	  ,case 
	     when eomonth(timeperiod) = eomonth(spellstartdate)  then 1
		 else 0
		 end as spell_admission
  	  ,SpellEndDate
	  ,case 
	     when eomonth(timeperiod) = eomonth(SpellEndDate)  then 1
		 else 0
		 end as spell_discharge
      ,[SpellLOS]
      ,los.[SpellLOSBanding]
	  ,los.[EpisodeStartDate]
	   ,case 
	     when eomonth(timeperiod) = eomonth(los.[EpisodeStartDate])  then 1
		 else 0
		 end as ward_episode_admission

	  ,los.EpisodeEndDate

		  ,case 
	     when eomonth(timeperiod) = eomonth(los.EpisodeEndDate)  then 1
		 else 0
		 end as ward_episode_discharge
		       ,[EpisodeLOS]
      ,los.[EpisodeLOSBanding]
      ,pat.[PatientCategory]
	  ,[WardSecurityLevel]
      ,[MentalHealthActGroup]
	  ,[CriminalJustice]
      ,[AdmissionReasonsMentalDisorder]
      ,[AdmissionReasonsHarmToSelf]
      ,[AdmissionReasonsSuicidalIdeation]
      ,[AdmissionReasonsHarmToOthers]
      ,[AdmissionReasonsEatingDisorder]
      ,[AdmissionReasonsOffendingBehaviour]
	  ,case when [BedType] = 110 then 'Acute adult'
			when [BedType] = 111 then 'Acute older'
			when [BedType] = 112 then 'PICU'
			when [BedType] = 113 then 'Eating Disorders'
			when [BedType] = 114 then 'Mother and Baby'
			when [BedType] = 115 then 'Learning Disabilities'
			when [BedType] = 116 then 'Low secure'
			when [BedType] = 117 then 'High dependency rehabilitation'
			when [BedType] = 118 then 'Long term rehabilitation/ Continuing Care'
			when [BedType] = 119 then 'Low secure'
			when [BedType] = 120 then 'Medium secure'
			when [BedType] = 121 then 'High secure'
			when [BedType] = 122 then 'Neuro-psychiatry / Acquired Brain Injury'
			when [BedType] = 140 then 'Adult Personality disorder'
			when [BedType] = 141 then 'Adult Deaf'
			when [BedType] = 123 then 'CAMHS inpatient – Child (including High Dependency)'
			when [BedType] = 124 then 'CAMHS inpatient - Adolescent (including High Dependency)'
			when [BedType] = 125 then 'Eating Disorders inpatient - Adolescent (above 12)'
			when [BedType] = 126 then 'Eating Disorders inpatient - Child (12 years and under)'
			when [BedType] = 127 then 'CAMHS Low Secure Mental Illness'
			when [BedType] = 128 then 'CAMHS Medium Secure Mental Illness'
			when [BedType] = 129 then 'Child Mental Health inpatient services for the Deaf'
			when [BedType] = 130 then 'CAMHS Learning Disabilities / Autistic Spectrum Disorder inpatient'
			when [BedType] = 131 then 'CAMHS Low Secure Learning Disabilities'
			when [BedType] = 132 then 'CAMHS Medium Secure Learning Disabilities'
			when [BedType] = 133 then 'Severe Obsessive Compulsive Disorder and Body Dysmorphic Disorder - Adolescent'
			when [BedType] = 134 then 'CAMHS Psychiatric Intensive Care Unit'
			else 'Error - please check' 
			end as bed_detail
	, case when [BedType] between 123 and 134 then 'CAMHS'
		else 'Adult'
		end as bed_type
      ,[CareTreatmentReview]
      ,[HasEducationHealthAndCarePlan]
      ,[HasPatientNamedKeyWorker]
	  ,SubmittingCommissionerName
	  ,OriginatingCCGICSName
	  ,[Distance(km)]
      ,[OAPReasonNoLocalSpecialistBed]
      ,[OAPReasonMoreSpecialist]
      ,[OAPReasonCloserToFamily]
      ,[OAPReasonSchoolLocation]
      ,[OAPReasonNoLocalBed]
      ,[OAPReasonSafeguarding]
      ,[OAPReasonOffendingRestrictions]
      ,[OAPReasonChoice]
      ,[OAPReasonOther]
      ,[OAPReasonNA]
	  ,CTRDate
	  ,[CTRType]
	  ,[OutcomeStatus]
	  ,[StatusDetail]
	  ,[ScheduledCTRDate]
	  ,dis.[DateOfPlannedTransfer]
	  ,MostRecentCtrDate
      ,dis.[TransferPlan]
	  ,case when dis.[TransferPlan] = 1 then 'Independent Living'
	  when dis.[TransferPlan] = 2 then 'Supported Housing'
	  when dis.[TransferPlan] = 3 then 'Family home'
	  when dis.[TransferPlan] = 4 then 'Residential Care'
	  when dis.[TransferPlan] = 5 then 'Residential School or College'
	  when dis.[TransferPlan] = 50 then 'Acute hospitals for physical health care'
	  when dis.[TransferPlan] = 51 then 'Prison'
	  when dis.[TransferPlan] = 14 then 'No transfer planned'
	  when dis.[TransferPlan] = 16 then 'Other'
	  when dis.[TransferPlan] = 110 then 'Acute adult'
			when dis.[TransferPlan] = 111 then 'Acute older'
			when dis.[TransferPlan] = 112 then 'PICU'
			when dis.[TransferPlan] = 113 then 'Eating Disorders'
			when dis.[TransferPlan] = 114 then 'Mother and Baby'
			when dis.[TransferPlan] = 115 then 'Learning Disabilities'
			when dis.[TransferPlan] = 116 then 'Low secure'
			when dis.[TransferPlan] = 117 then 'High dependency rehabilitation'
			when dis.[TransferPlan] = 118 then 'Long term rehabilitation/ Continuing Care'
			when dis.[TransferPlan] = 119 then 'Low secure'
			when dis.[TransferPlan] = 120 then 'Medium secure'
			when dis.[TransferPlan] = 121 then 'High secure'
			when dis.[TransferPlan] = 122 then 'Neuro-psychiatry / Acquired Brain Injury'
			when dis.[TransferPlan] = 140 then 'Adult Personality disorder'
			when dis.[TransferPlan] = 141 then 'Adult Deaf'
			when dis.[TransferPlan] = 123 then 'CAMHS inpatient – Child (including High Dependency)'
			when dis.[TransferPlan] = 124 then 'CAMHS inpatient - Adolescent (including High Dependency)'
			when dis.[TransferPlan] = 125 then 'Eating Disorders inpatient - Adolescent (above 12)'
			when dis.[TransferPlan] = 126 then 'Eating Disorders inpatient - Child (12 years and under)'
			when dis.[TransferPlan] = 127 then 'CAMHS Low Secure Mental Illness'
			when dis.[TransferPlan] = 128 then 'CAMHS Medium Secure Mental Illness'
			when dis.[TransferPlan] = 129 then 'Child Mental Health inpatient services for the Deaf'
			when dis.[TransferPlan] = 130 then 'CAMHS Learning Disabilities / Autistic Spectrum Disorder inpatient'
			when dis.[TransferPlan] = 131 then 'CAMHS Low Secure Learning Disabilities'
			when dis.[TransferPlan] = 132 then 'CAMHS Medium Secure Learning Disabilities'
			when dis.[TransferPlan] = 133 then 'Severe Obsessive Compulsive Disorder and Body Dysmorphic Disorder - Adolescent'
			when dis.[TransferPlan] = 134 then 'CAMHS Psychiatric Intensive Care Unit'
			else 'Error - please check' 
			end as planned_discharge_destination

  FROM [NHSE_Sandbox_LDP_Shared].[dbo].[InpatientLengthOfStay] as los
   
  left join [NHSE_Sandbox_LDP_Shared].[dbo].[EpisodesCommissioners_vw] as prov
  	on los.[UniqueID] = prov.[UniqueID] and 
	los.EpisodeID = prov.EpisodeID

	left join [NHSE_Sandbox_LDP_Shared].[dbo].[DischargePlanDetails] as dis
	on los.EpisodeID = dis.EpisodeID

	left join[NHSE_Sandbox_LDP_Shared].[dbo].[Inpatients] as pat
	on los.[UniqueID] = pat.[UniqueID]


left join [NHSE_Sandbox_LDP_Shared].[dbo].[CleansedCTRDates] as ctr
	on los.[UniqueID] = ctr.[UniqueID]


  left join [NHSE_Sandbox_LDP_Shared].[dbo].[InpatientEpisodesDetails] as epi
	on --los.[UniqueID] = epi.[UniqueID] 
	--and 
	los.EpisodeID = epi.EpisodeID

  left join [NHSE_Sandbox_LDP_Shared].[dbo].[DistanceFromHome] as dist
	on los.EpisodeID = dist.EpisodeID

 left join  [NHSE_Sandbox_LDP_Shared].[dbo].[ProviderEpisodes] as provepi
	on los.EpisodeID = provepi.EpisodeID


--where los.EpisodeEndDate >=   '2019-03-01' 
    --and [SubmittingCCGRegionName] = 'SOUTH WEST'

  --and los.UniqueID = '10'


  where --los.EpisodeEndDate >=   '2025-03-01' 
     [OriginatingCCGRegionName] = 'SOUTH WEST'
	and timeperiod between      
	dateadd (mm, -23, (select max (timeperiod) from [NHSE_Sandbox_LDP_Shared].[dbo].[InpatientLengthOfStay]))
	and ( select max (timeperiod) from [NHSE_Sandbox_LDP_Shared].[dbo].[InpatientLengthOfStay])
	--and ccgorsc = 'ccg'
	and ctr.CTRDate = (select max(CTRDate) 
					  FROM [NHSE_Sandbox_LDP_Shared].[dbo].[CleansedCTRDates] AS max_CTR
					  WHERE ctr.[UniqueID] = max_CTR.[UniqueID])

	--and SpellEndDate > '2022-08-31'
	--and TimePeriod = '2022-07-31'


   order by TimePeriod desc




