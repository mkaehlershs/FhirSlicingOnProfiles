ValueSet: AllChildCodes
Id: all-child-codes
Title: "All child codes"
Description: "All Child codes"
* SCT#22253000 "Pain (finding)"
* SCT#2275879005 "Abdominal migraine (disorder)"
* SCT#21522001 "Abdominal pain (finding)"

Profile: SDParentProfile
Parent: Observation
Id: sd-parent-observation
Title: "Parent Profile"
Description: "tbd"
* code 1..1 //this is very important
* code from AllChildCodes
//* code = SCT#22253000 "Pain (finding)"
* value[x] only Quantity
* valueQuantity 1..1
* valueQuantity.code = http://unitsofmeasure.org#g/mL

Profile: SDChild1Profile
Parent: Observation
Id: sd-child1-observation
Title: "Child1 Profile"
Description: "Child1 Profile"
* code = SCT#2275879005 "Abdominal migraine (disorder)"
* value[x] only Quantity
* valueQuantity 1..1
* valueQuantity.code = http://unitsofmeasure.org#g/mL

Profile: SDChild2Profile
Parent: Observation
Id: sd-child2-observation
Title: "Child2 Profile"
Description: "Child2 Profile"
* code = SCT#21522001 "Abdominal pain (finding)"
* value[x] only Quantity
* valueQuantity 1..1
* valueQuantity.code = http://unitsofmeasure.org#g/mL

Profile: SDReferenceProfileHierarchy
Parent: Observation
Title: "Reference profile hierarchy"
Description: "Reference profile hierarchy"
* hasMember ^slicing.discriminator.type = #profile
* hasMember ^slicing.discriminator.path = "$this.resolve()"
* hasMember ^slicing.rules = #open
* hasMember ^slicing.ordered = false
* hasMember contains
        sliceMemberOne 0..*
* hasMember[sliceMemberOne] only Reference(SDParentProfile)

Instance: Child1ObservationExample
InstanceOf: SDChild1Profile
Title: "sd-child1-observation"
Usage: #example
Description: "sd-child1-observation"
* status = 	#preliminary
* code.coding[0] = SCT#2275879005 "Abdominal migraine (disorder)"
* effectiveDateTime = 1998-02-13T12:30:17+02:00
* valueQuantity = 10.8 'g/mL' "g/mL"

Instance: Child2ObservationExample
InstanceOf: SDChild2Profile
Title: "sd-child2-observation"
Usage: #example
Description: "sd-child2-observation"
* status = 	#preliminary
* code.coding[0] = SCT#21522001 "Abdominal pain (finding)"
* effectiveDateTime = 1998-02-13T12:30:17+02:00
* valueQuantity = 10.8 'g/mL' "g/mL"

Instance: HierarchyParentObservationExample
InstanceOf: SDParentProfile
Title: "sd-hierarchy-parent-observation"
Usage: #example
Description: "sd-hierarchy-parent-observation"
* status = 	#preliminary
* code.coding[0] = SCT#2275879005 "Abdominal migraine (disorder)"
* effectiveDateTime = 1998-02-13T12:30:17+02:00
* valueQuantity = 10.8 'g/mL' "g/mL"

Instance: ReferenceHierachyExample
InstanceOf: SDReferenceProfileHierarchy
Title: "SDReferenceProfileHierarchy"
Usage: #example
Description: "SDReferenceProfileHierarchy"
* status = 	#preliminary
* category = http://terminology.hl7.org/CodeSystem/observation-category#imaging
* code.coding[0] = SCT#131184002 "Area of defined region"
* effectiveDateTime = 1998-02-13T12:30:17+02:00
* valueQuantity = 391 'g/mL' "g/mL"
* hasMember[0] = Reference(Child1ObservationExample)
* hasMember[+] = Reference(Child2ObservationExample)
//* hasMember[+] = Reference(HierarchyParentObservationExample)