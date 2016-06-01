//
//  Webservice.h
//  
//
//  Created by samosys on 26/10/15.
//
//

#import <Foundation/Foundation.h>

@interface Webservice : NSObject{
    
    
    NSURLConnection *l_theConnection;
    NSMutableData *m_mutResponseData;
    int m_intResponseCode;
    
    id              callBackTarget;
    SEL				callBackSelector;
    
}
/* This method called to Verify Access Code*/
-(void)VerifyAccessCode:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)accessCode;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=accesscode_varify&code=tHA8qI6b

/* This method called to Regitratiobn of Parent's Id*/
-(void)RegistrationParent:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)email : (NSString *)firstname : (NSString *)lastname : (NSString *)password : (NSString *)phonenumber;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=step2&Email=akhilesh.tenguriya3443443@samosys.com&firstname=akhilesh&lastname=tenguriya&password=1234567789&phone_number=123445

/* This method called to Regitratiobn of Parent's Id*/
-(void)ChildsRegistration:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)parentsid :(NSString *)firstname : (NSString *)lastname :(NSString *)username :(NSString *)password :(NSString *)allowFrequency :(NSString *)allowAmount :(NSString *)paymentDate :(NSString *)init_deposit :(NSString *)birthday :(NSString *)accessCode ;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=step3&userid=2492&cfirstname=akhilesh&clastname=akhilesh&cusername=tenguriya&cpassword=1234567789&alfrequency=123445&alamount=1212&paydate=3423&initial_deposit=45345&birthday=22-4-1990&codeid=1023

/*This method called to Choose Den Allowcation*/
-(void)Choose_Den_Allowcation:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)allowcation_Type :(NSString *)parentsID :(NSString *)childsID :(NSString *)save :(NSString *)spend :(NSString *)give :(NSString *)init_deposit :(NSString *)code;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=chooseden_allocationtype&allocation_type=1&initial_deposit=45345&childid=1292&save=45&spend=45&give=10

/* This method called to Login*/
-(void)Login:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)username : (NSString *)password ;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=login&username=akhilesh.tenguriya7@gmail.com&password=123456789


/* This method called to Show User Profile */
-(void)Show_User_Profile:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)userID : (NSString *)UserGroup ;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=current_profile&user_id=3&user_group=3

/* This method called to Childs List bu parents id */
-(void)ChildsList:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)userID : (NSString *)UserGroup ;
// http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=child_list_using_parentid&parent_id=24&group_id=2

/* This method called to My Money By Childs ID */
-(void)MyMoneybyChildsID:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)userID : (NSString *)UserGroup ;
 //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=parentMoneyInformation&child_id=2495&group_id=2

/* This method called to Amount to show */
-(void)Show_Amount:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)userID  ;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=amount_deposit_show&child_id=1217

/* This method called to Amount to deposit*/
-(void)amountToDeposit:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)childID :(NSString *)money :(NSString *)allowcation :(NSString *)desc  ;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=amount_deposit_save&child_id=1219&money=100&allocation=[%2280.00%22,%2210.00%22,%2210.00%22]&desc=test

/* This method called to Amounr to withdraw */
-(void)amountToWithdraw:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)childID :(NSString *)money :(NSString *)allowcation :(NSString *)desc  ;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=amount_withdraw_save&child_id=1219&money=100&allocation=[%2280.00%22,%2210.00%22,%2210.00%22]&desc=test



/* This method called to Add item to WishList By Childs ID */
-(void)AddItemtoWishList:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)cost  : (NSString *)item  : (NSString *)child  ;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=wishlist_Add_item&cost=100&item=test&child_id=1222

/* This method called to Wishlist By Childs ID */
-(void)ShowWishList:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)child  ;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=wishlist&childid=413

/* This method called to Add item to WishList By Childs ID */
-(void)EditItemtoWishList:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)cost  : (NSString *)item  : (NSString *)itemid  : (NSString *)childid  ;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=wishlist_update&id=307&child_id=1242&item=new%20test&cost=1200

/* This method called to History By Childs ID */
-(void)History:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)child :(NSString *)day :(NSString *)month  :(NSString *)year ;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=history_search&childid=1187&day=12&month=05&year=2015


/* This method called to Lost password ID */
-(void)Send_History:(SEL)tempSelector tempTarget:(id)tempTarget  : (NSString *)history_Id :(NSString *)child_Id ;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=child_histry_detail&history_id=%@&child_id=%@

/* This method called to Removeitem form Wishlist By Childs ID */
-(void)removeItem:(SEL)tempSelector tempTarget:(id)tempTarget  : (NSString *)itemID   : (NSString *)child  ;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=wishlist_remove&id=295&child_id=1239

/* This method called to update  Parent's Profile*/
-(void)UpdateParetnProfile:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)email : (NSString *)firstname : (NSString *)lastname : (NSString *)password : (NSString *)phonenumber :(NSString *)parentsid;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=update_parent_profile&firstname=akhilesh&lastname=akhilesh&Email=tenguriya&password=123456789&phone_number=12344&parentid=25

/* This method called to update  Parent's Profile*/
-(void)UpdateChildProfile:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)childId :(NSString *)username:(NSString *)firstname : (NSString *)lastname :(NSString *)password :(NSString *)allowFrequency :(NSString *)allowAmount :(NSString *)paymentDate :(NSString *)birthday :(NSData *)imageData;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=update_child_profile&child_id=2512&firstname=hemant&lastname=chouhan&password=1234&birthday=1992-10-09allowance=10000&allowance_frequency=Monthly&allowance_payday=12


/* This method called to Lost password ID */
-(void)forgotPosswordParents:(SEL)tempSelector tempTarget:(id)tempTarget  : (NSString *)email;
// http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=forget_pass_parent&email=kalyan.thakur@samosys.com&phone=1234567890&password=122

/* This method called to Lost password ID */
-(void)forgotPosswordchild:(SEL)tempSelector tempTarget:(id)tempTarget  : (NSString *)username;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=forget_pass_child&username=suresh&birthday=1991-10-30

// This Methode called for settings Screen
-(void)Setting:(SEL)tempSelector tempTarget:(id)tempTarget  : (NSString *)userid : (NSString *)allowance_Reminder : (NSString *)save_givereminder : (NSString *)automate_allowance;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=setting&parentid=2547&allowance_reminder=1&saving_giving_reminder=1&automate_allowance=1

//show setting of user
-(void)ShowSetting:(SEL)tempSelector tempTarget:(id)tempTarget  : (NSString *)userid;
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=show_setting&userid=2627

@end