Profile: SDUmbrellaObservation
Parent: Observation
Id: sd-umbrella-observation
Title: "Collection Observation"
Description: "tbd"
* code = SCT#131184002 "Area of defined region" 
* hasMember ^slicing.discriminator.type = #profile
* hasMember ^slicing.discriminator.path = "$this.resolve()"
* hasMember ^slicing.rules = #open
* hasMember ^slicing.ordered = false
* hasMember contains
        sliceMemberOne 0..* and
        sliceMemberTwo 0..* and
        sliceMemberThree 0..* 
* hasMember[sliceMemberOne] only Reference(SDMemberOneObservation)
* hasMember[sliceMemberTwo] only Reference(SDMemberTwoObservation)
* hasMember[sliceMemberThree] only Reference(SDMemberThreeObservation)
* value[x] only Quantity
* valueQuantity 1..1
* valueQuantity = http://unitsofmeasure.org#mm2

Profile: SDMemberOneObservation
Parent: Observation
Id: sd-memeber-one-observation
Title: "Member one observation"
Description: "tbd"
* insert ValueSetCodeSlicesRule
* code.coding[commonCode] = DCM#126401 "SUVbw"
* value[x] only Quantity
* valueQuantity 1..1
* valueQuantity.code = http://unitsofmeasure.org#g/mL

Profile: SDMemberTwoObservation
Parent: Observation
Id: sd-memeber-two-observation
Title: "Member two observation"
Description: "tbd"
* insert ValueSetCodeSlicesRule
* code.coding[commonCode] = DCM#110852 "MR signal intensity"
* value[x] only Quantity
* valueQuantity 1..1
* valueQuantity.code = http://unitsofmeasure.org#g/mL

Profile: SDMemberThreeObservation
Parent: Observation
Id: sd-memeber-three-observation
Title: "Member three observation"
Description: "tbd"
* insert ValueSetCodeSlicesRule
* code.coding[commonCode] = RADLEX#RID39166 "Density"
* value[x] only Quantity
* valueQuantity 1..1
* valueQuantity.code = http://unitsofmeasure.org#g/mL

Instance: UmbrellaObservationExample
InstanceOf: SDUmbrellaObservation
Title: "tbd"
Usage: #example
Description: "tbd"
* status = 	#preliminary
* category = http://terminology.hl7.org/CodeSystem/observation-category#imaging
* code.coding[0] = SCT#131184002 "Area of defined region"
* effectiveDateTime = 1998-02-13T12:30:17+02:00
* valueQuantity.value = 391
* valueQuantity.code = http://unitsofmeasure.org#mm2
* hasMember[0] = Reference(MemberOneObservationExample)

Instance: MemberOneObservationExample
InstanceOf: SDMemberOneObservation
Title: "tbd"
Usage: #example
Description: "tbd"
* status = 	#preliminary
* category = http://terminology.hl7.org/CodeSystem/observation-category#imaging
* code.coding[commonCode] = DCM#126401 "SUVbw"
* effectiveDateTime = 1998-02-13T12:30:17+02:00
* valueQuantity = 10.8 'g/mL' "g/mL"