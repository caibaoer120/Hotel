 $( document ).ready(function(){
        
        <!-- 顶部栏_搜索框的清除按钮的js  -->

        $('#msearch_input').focus(function(){  
             $('#msearch_input_clear').show();
        });  

        $('#msearch_input').blur(function(){  
            if($(this).val()==''){  
                $('#msearch_input_clear').hide();  
            }
        }); 

        $('#msearch_input_clear').click(function(){  
            $('#msearch_input').val('');  
            $(this).hide();
        }); 

    });