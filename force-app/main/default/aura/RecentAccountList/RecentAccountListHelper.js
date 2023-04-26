({
    getAccounts : function(component) {
        var getAcc = component.get("c.getAccounts");
        
        getAcc.setCallback(this, function(res){
            if(res.getState() == 'SUCCESS'){
                component.set('v.accounts',res.getReturnValue());
            }else{
                console.log('Error Occured:-'+res.getReturnValue());
            }
        });
        $A.enqueueAction(getAcc);
    }
})