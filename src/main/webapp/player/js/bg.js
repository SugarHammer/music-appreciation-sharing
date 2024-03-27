$(function(){
    let arrImg = ['3.jpg','4.jpg','233.jpg'];
    let index = 0;
    let dis = 0;
    let timer = null;
    let timer1 = null;

    show(index);
    
    function show(index,dis){
        $('header').css({
            'background':'url(./images/'+arrImg[index]+') no-repeat',
            'backgroundSize':'100% 100%',
             // 'opacity': dis || 0,
             'transition':'1.8s'

            
        });
    }
    
    timer1 = setInterval(function(){
        index++;
        
        if(index > arrImg.length - 1) index = 0;
        console.log(index);
        
        show(index,dis);
        dis = 0;
    },3000)
    timer = setInterval(function(){
        dis+= 0.004;
        show(index,dis);
        if(dis == 1){
            clearInterval(timer);
        }
    },10)
    $('header').hover(function(){
          clearInterval(timer1);
    },function(){
        clearInterval(timer1);
        timer1 = setInterval(function(){
            index++;
            
            if(index > arrImg.length - 1) index = 0;
            show(index,dis);
            dis = 0;
        },2000)
    })
    
})