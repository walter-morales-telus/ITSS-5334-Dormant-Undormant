/* UNDORMANT */
UPDATE nc_params 
SET list_value_id = 7021759771013444981  /* Active */  
WHERE attr_id = 7021759771013444983      /* Status */ 
AND 
object_id IN
(
    9164908990944457620, /* Collect Calling Block */
    9164929280463303474, /* 3rd Number Block */ 
    9164912403320407836, /* Display Block */ 
    9164913548919303412, /* Order processing charge */ 
    9164913578769407851, /* Line connection charge */ 
    9164913734576890961, /* Technician Visit Charge*/
    9164895495785457574  /* Stand Alone */ 
);

UPDATE nc_params 
SET list_value_id = 7021759771013444980 /* Planned */   
WHERE attr_id = 7021759771013444983     /* Status */ 
AND 
object_id IN
(
    9159645204213569084, /* Home Phone COVO */
    9159645106313569007, /* Home Phone Lite COVO */
    9159645238213569275, /* Stand Alone COVO */

    9159687403913588646, /* 2nd Smart Ring */
    9159687516513588676, /* 3rd Smart Ring */
    9159687538013588693, /* Voice mail basic */
    9159687609313588818, /* Voice mail combine */
    9159687840113588969, /* Intercommunication */
    9159688304813589195, /* Extensions on Continuous Property */
    9159688377513589220, /* Off Premise Extension */
    9159688394413589245, /* Call Forwarding Fixed Central Office */
    9159688499313589733, /* Call Return Block */
    9159688508813590084, /* Busy Call Return prompt block */
    9159688539913590450, /* Call Trace Block */
    9159688573513591152  /* Blocking vocal segment */
);

/* ALLOW 911 Deselect*/
update nc_params set value = '0' where attr_id = 9125718672413237366 and object_id in 
(
    select relationship.object_id
    from nc_references r,
    nc_references child,
    nc_objects relationship
    where relationship.object_type_id = 9125737315713245977 /* Product Offering Relationship */
    and r.object_id = relationship.object_id
    and r.attr_id = 9125718672413237377 /* Parent */
    and r.reference in (9164472127674923587, 9162909276385310484)
    and child.object_id = r.object_id
    and child.attr_id = 9125718672413237378
    and child.reference in (9162873610565861000)
);

/* ALLOW Name Display Deselect */
update nc_params set value = '0' where attr_id = 9125718672413237366 and object_id in 
(
    select relationship.object_id
    from nc_references r, nc_references child, nc_objects relationship
    where relationship.object_type_id = 9125737315713245977 /* Product Offering Relationship */
    and r.object_id = relationship.object_id
    and r.attr_id = 9125718672413237377 /* Parent */
                     /* Home Phone           Home Phone Lite */
    and r.reference in (9164472127674923587, 9162909276385310484)
    and child.object_id = r.object_id
    and child.attr_id = 9125718672413237378
                         /* Name Display*/
    and child.reference in (9136923654113578870)
);

UPDATE nc_params    /*YES*/
SET list_value_id = 5032957201013871249	  
WHERE     /* Is Active */
attr_id = 7030253282013155504 
AND 
object_id IN
(   /* Warn when removing more than 5 features of Home Phone plan */
    9164874331390407744,
    /* Warn when “Remove” 900 Block & Toll Block because of additional fee */
    9164964965693303513,
    /* Warning message is shown if no long distance plan is selected */
    9164872816244407743,
    /* Add tech charge when TQ Home Phone is not Warm home */
    9164913781570303415
);
