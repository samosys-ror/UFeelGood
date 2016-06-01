//
//  Webservice.m
//  
//
//  Created by samosys on 26/10/15.
//
//

#import "Webservice.h"
#import "Utilities.h"
#import "SBJSON.h"
#import "AppDelegate.h"
@implementation Webservice

#define WEBURL @"http://103.15.67.74/pro1/U_feel_good/webservice/ufeelgood_webservice.php?method="
AppDelegate *l_appDelegate;

/*
 This method called to Verify Access Code*/
-(void)VerifyAccessCode:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)accessCode{
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=accesscode_varify&code=tHA8qI6b
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@accesscode_varify&code=%@",WEBURL,accessCode];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
    
}

/* This method called to Regitratiobn of Parent's Id*/
-(void)RegistrationParent:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)email : (NSString *)firstname : (NSString *)lastname : (NSString *)password : (NSString *)phonenumber
{
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=step2&Email=akhilesh.tenguriya3443443@samosys.com&firstname=akhilesh&lastname=tenguriya&password=1234567789&phone_number=123445
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@step2&Email=%@&firstname=%@&lastname=%@&password=%@&phone_number=%@",WEBURL,email,firstname,lastname,password,phonenumber];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }

}
/* This method called to Regitratiobn of Parent's Id*/
-(void)ChildsRegistration:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)parentsid :(NSString *)firstname : (NSString *)lastname : (NSString *)username :(NSString *)password :(NSString *)allowFrequency :(NSString *)allowAmount :(NSString *)paymentDate :(NSString *)init_deposit :(NSString *)birthday :(NSString *)accessCode
{
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=step3&userid=2492&cfirstname=akhilesh&clastname=akhilesh&cusername=tenguriya&cpassword=1234567789&alfrequency=123445&alamount=1212&paydate=3423&initial_deposit=45345&birthday=22-4-1990&codeid=1023
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@step3&userid=%@&cfirstname=%@&clastname=%@&cusername=%@&cpassword=%@&alfrequency=%@&alamount=%@&paydate=%@&initial_deposit=%@&birthday=%@&codeid=%@",WEBURL,parentsid,firstname,lastname,username,password,allowFrequency,allowAmount,paymentDate,init_deposit,birthday,accessCode];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}

/*This method called to Choose Den Allowcation*/
-(void)Choose_Den_Allowcation:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)allowcation_Type :(NSString *)parentsID :(NSString *)childsID :(NSString *)save :(NSString *)spend :(NSString *)give :(NSString *)init_deposit :(NSString *)code
{
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=chooseden_allocationtype&allocation_type=1&childid=1292&parentid=2492&save=45&spend=45&give=10&initial_deposit=5000
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@chooseden_allocationtype&allocation_type=%@&parentid=%@&childid=%@&save=%@&spend=%@&give=%@&initial_deposit=%@&code_id=%@",WEBURL,allowcation_Type,parentsID,childsID,save,spend,give,init_deposit,code];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
/* This method called to Login*/
-(void)Login:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)username : (NSString *)password {
   // http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=login&username=akhilesh.tenguriya3443443@samosys.com&password=akki@123
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
   
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@login&username=%@&password=%@&type=1&lat=22.727009&long=75.880990",WEBURL,username,password];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
/* This method called to Show User Profile */
-(void)Show_User_Profile:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)userID : (NSString *)UserGroup
{
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=current_profile&user_id=3&user_group=3

    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];


    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@current_profile&user_id=%@&user_group=%@",WEBURL,userID,UserGroup];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
    
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    
    
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
    
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
    
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
            //[temp_strJson release];
    
    }
    else
    {
    
    }
}
//* This method called to Childs List bu parents id */
-(void)ChildsList:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)userID : (NSString *)UserGroup
{
    // http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=child_list_using_parentid&parent_id=24&group_id=2
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@child_list_using_parentid&parent_id=%@&group_id=%@",WEBURL,userID,UserGroup];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
/* This method called to My Money By Childs ID */
-(void)MyMoneybyChildsID:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)userID : (NSString *)UserGroup
{
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=parentMoneyInformation&child_id=2495&group_id=2
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@parentMoneyInformation&child_id=%@&group_id=%@",WEBURL,userID,UserGroup];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
/* This method called to My Money By Childs ID */
-(void)Show_Amount:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)userID
{
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=amount_show&child_id=1217
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@amount_show&child_id=%@",WEBURL,userID];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
/* This method called to My Money By Childs ID */
-(void)amountToDeposit:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)childID :(NSString *)money :(NSString *)allowcation :(NSString *)desc
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=amount_deposit_save&child_id=1219&money=100&allocation=[%2280.00%22,%2210.00%22,%2210.00%22]&desc=test

{
   
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@amount_deposit_save&child_id=%@&money=%@&allocation=%@&desc=%@",WEBURL,childID,money,allowcation,desc];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
/* This method called to My Money By Childs ID */
-(void)amountToWithdraw:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)childID :(NSString *)money :(NSString *)allowcation :(NSString *)desc
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=amount_withdraw_save&child_id=1219&money=100&allocation=[%2280.00%22,%2210.00%22,%2210.00%22]&desc=test

{
    
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@amount_withdraw_save&child_id=%@&money=%@&allocation=%@&desc=%@",WEBURL,childID,money,allowcation,desc];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
/* This method called to My Money By Childs ID */
-(void)AddItemtoWishList:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)cost  : (NSString *)item  : (NSString *)child
//http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=wishlist_Add_item&cost=100&item=test&child_id=1222

{
    
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@wishlist_Add_item&cost=%@&item=%@&child_id=%@",WEBURL,cost,item,child];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
/* This method called to My Money By Childs ID */
-(void)ShowWishList:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)child  {
    
    
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=wishlist&childid=413
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@wishlist&childid=%@",WEBURL,child];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
/* This method called to History By Childs ID */
-(void)History:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)child :(NSString *)day :(NSString *)month :(NSString *)year
{
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=history_search&childid=1187&day=12&month=05&year=2015
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@history_search&childid=%@&day=%@&month=%@&year=%@",WEBURL,child,day,month,year];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
/* This method called to Lost password ID */
-(void)Send_History:(SEL)tempSelector tempTarget:(id)tempTarget  : (NSString *)history_Id :(NSString *)child_Id
{
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=child_histry_detail&history_id=%@&child_id=%@
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@child_histry_detail&history_id=%@&child_id=%@",WEBURL,history_Id,child_Id];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }

}
/* This method called to Removeitem form Wishlist By Childs ID */
-(void)removeItem:(SEL)tempSelector tempTarget:(id)tempTarget  : (NSString *)itemID   : (NSString *)child  {
    
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=wishlist_remove&id=295&child_id=1239
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@wishlist_remove&id=%@&child_id=%@",WEBURL,itemID,child];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}

/* This method called to Add item to WishList By Childs ID */
-(void)EditItemtoWishList:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)cost :(NSString *)item :(NSString *)itemid :(NSString *)childid
{
   
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=wishlist_update&id=307&child_id=1242&item=new%20test&cost=1200
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@wishlist_update&id=%@&child_id=%@&item=%@&cost=%@",WEBURL,itemid,childid,item,cost];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
    }
    else
    {
        
    }
}

/* This method called to update  Parent's Profile*/
-(void)UpdateParetnProfile:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)email : (NSString *)firstname : (NSString *)lastname : (NSString *)password : (NSString *)phonenumber :(NSString *)parentsid{
    
    
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=update_parent_profile&firstname=akhilesh&lastname=akhilesh&Email=tenguriya&password=123456789&phone_number=12344&parentid=25
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@update_parent_profile&Email=%@&firstname=%@&lastname=%@&password=%@&phone_number=%@&parentid=%@",WEBURL,email,firstname,lastname,password,phonenumber,parentsid];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
    
}
/* This method called to Removeitem form Wishlist By Childs ID */
-(void)forgotPosswordParents:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)email   {
    
  // http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=forget_pass_parent&email=kalyan.thakur@samosys.com&phone=1234567890&password=122
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@forget_pass_parent&email=%@",WEBURL,email];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
/* This method called to Removeitem form Wishlist By Childs ID */
-(void)forgotPosswordchild:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)username
{
    
    // //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=forget_pass_child&username=suresh&birthday=1991-10-30
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@forget_pass_child&username=%@",WEBURL,username];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
-(void)UpdateChildProfile:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)childId :(NSString *)username :(NSString *)firstname :(NSString *)lastname :(NSString *)password :(NSString *)allowFrequency :(NSString *)allowAmount :(NSString *)paymentDate :(NSString *)birthday :(NSData *)imageData
{
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=update_child_profile&child_id=2512&firstname=hemant&lastname=chouhan&password=1234&birthday=1992-10-09allowance=10000&allowance_frequency=Monthly&allowance_payday=12
    
    
    
//    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
//    
//    
//    callBackSelector=tempSelector;
//    callBackTarget=tempTarget;
//    if([Utilities CheckInternetConnection])//0: internet working
//    {
//        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//        NSMutableString *temp_url;
//        temp_url=[NSMutableString stringWithFormat:@"%@update_child_profile&child_id=%@&firstname=%@&lastname=%@&password=%@&birthday=%@&allowance=%@&allowance_frequency=%@&allowance_payday=%@&user_name=%@",WEBURL,childId,firstname,lastname,password,birthday,allowAmount,allowFrequency,paymentDate,username];
//        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        NSLog(@"%@",temp_url);
//        
//        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
//        
//        
//        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
//        
//        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
//        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
//        [theRequest setHTTPMethod:@"GET"];
//        
//        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
//        
//        [l_theConnection start];
//        
//        if(l_theConnection)
//        {
//            NSLog(@"Request sent to get data");
//        }
//        //[temp_strJson release];
//        
//    }
//    else
//    {
//        
//    }
//
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=add_new_product&product_name=test product&description=test desc&price=12&user_id=1&category_id=1&brand_id=1&size_id=1&image_name=test.jpg
        
        
        //http://103.15.67.74/pro1/cabbooking/ws/newwebservices.php?method=profile_update&fullname=divyansh&password=abcde&mobile=789456123&email=sur@gmail.com&image=/Screenshot_2015-12-30-00-19-10.png&user_type=passenger
        NSString  *urlStr=[NSMutableString stringWithFormat:@"%@update_child_profile",WEBURL];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        
        [request setURL:[NSURL URLWithString:urlStr]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"child_id\"\r\n\r\n%@",childId] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"firstname\"\r\n\r\n%@",firstname] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"lastname\"\r\n\r\n%@",lastname] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"password\"\r\n\r\n%@",password] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"birthday\"\r\n\r\n%@",birthday] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"allowance\"\r\n\r\n%@", allowAmount] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"allowance_frequency\"\r\n\r\n%@", allowFrequency] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"allowance_payday\"\r\n\r\n%@", paymentDate] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"user_name\"\r\n\r\n%@", username] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter2
        NSDate *sendimgename=[NSDate date];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"ddMMyyyy:hh:mm:ss"];
        
        NSString *stringFromDate = [formatter stringFromDate:sendimgename];
        
        //NSLog(@"%@",stringFromDate);
        
        
        
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\"%@.jpeg\"\r\n",stringFromDate]] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[@"Content-Type: image/png\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:imageData]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"PIC NAME IS %@",stringFromDate);
        [request setHTTPBody:body];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
        request = nil;
        
        
    }
    else if(![Utilities CheckInternetConnection])
    {
        
    }
}
-(void)Setting:(SEL)tempSelector tempTarget:(id)tempTarget  : (NSString *)userid : (NSString *)allowance_Reminder : (NSString *)save_givereminder : (NSString *)automate_allowance
{
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=setting&parentid=2547&allowance_reminder=1&saving_giving_reminder=1&automate_allowance=1
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@setting&parentid=%@&allowance_reminder=%@&saving_giving_reminder=%@&automate_allowance=%@",WEBURL,userid,allowance_Reminder,save_givereminder,automate_allowance];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
    
}
//show setting of user
-(void)ShowSetting:(SEL)tempSelector tempTarget:(id)tempTarget  : (NSString *)userid
{
    //http://103.15.67.74/pro1/dragon_bank/webservice/webservice.php?method=show_setting&userid=2627
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@show_setting&userid=%@",WEBURL,userid];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
- (void)makeConnection : (NSString *) post1 url:(NSString *)url1
{
    NSLog(@"hello");
    NSString *post = post1;
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    
    [request setURL:[NSURL URLWithString:url1]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    l_theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [l_theConnection start];
    
    if(l_theConnection)
    {
        NSLog(@"Request sent to get data");
    }
    //[temp_strJson release];
    
    request = nil;
}

#pragma mark -
#pragma mark Connection response methods

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    m_intResponseCode = (int)[httpResponse statusCode];
    NSLog(@"%d",m_intResponseCode);
    
    if(m_mutResponseData!=nil)
    {
        m_mutResponseData=nil;
    }
    m_mutResponseData=[[NSMutableData alloc]init];
    [m_mutResponseData setLength:0];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [m_mutResponseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *str_response = [[NSString alloc] initWithData:m_mutResponseData encoding:NSUTF8StringEncoding] ;
    
    str_response = [str_response stringByReplacingOccurrencesOfString:@":)" withString:@""];
    ///str_response = [str_response stringByReplacingOccurrencesOfString:@" "  withString:@""];
    str_response = [str_response stringByReplacingOccurrencesOfString:@";)" withString:@""];
    
    if(m_mutResponseData)
        m_mutResponseData = nil;
    
    NSLog(@"connection :-%@",[connection description]);
    
    if (connection)
        [connection cancel];
    
    NSLog(@"%@",str_response);
    
    SBJSON *objJson = [SBJSON new];
    NSDictionary *dict = [objJson objectWithString:str_response];
    
    if (callBackTarget != nil && callBackSelector != nil) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [callBackTarget performSelector:callBackSelector withObject:dict];
        
#pragma clang diagnostic pop
    }
    else {
        NSLog(@"call back API calls called");
    }
    
    //[str_response release],str_response=nil;
    
    if (dict) {
        dict = nil;
    }
    
    objJson=nil;
    
}



@end
