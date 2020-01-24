$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = "";
    console.log(insertHTML);
    childSelectHtml = `<select class="listing-select-wrapper__box--select_1 edit_x edit_next" id="child_category">
                        <option value="---" data-category="---">---</option>
                        ${insertHTML}`;
    $(".parent_category").after(childSelectHtml);
  }
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = "";
    grandchildSelectHtml = `<select class="listing-select-wrapper__box--select_1 edit_x edit_next_u5" id="grandchild_category", name="product[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}`;
    $(".edit_x").after(grandchildSelectHtml);
  }
  $(".parent_category").on("change", function(){
    var parentCategory = document.getElementsByClassName("parent_category")[0].value;
    console.log(parentCategory);
    if (parentCategory != "---"){ 
      $.ajax({
        url: '/get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); 
      $('#grandchildren_wrapper').remove();
      
    }
    $("#margin_select").css("margin-top", 110)
    if (parentCategory == "---"){ 
      $("#margin_select").css("margin-top", 20)
    }else{
      $("#margin_select").css("margin-top", 110)
    }
  });
  $(".exhibition_main__container__product__detail__inner__select").on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    if (childId != "---"){
      $.ajax({
        url: '/get_category_grandchildren',
        type: 'GET',
        data: {child_id: childId},
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
    }
  });


  function update_field(){
    var result = $('#keyup').val();
    if (result == "") {
      $('#keyup1').text('_');
      $('#keyup2').text('_');
    } else {
    figure = parseFloat(result) * 1.1
    figure2 = parseFloat(figure) - result
    figure3 = Math.round(figure2);
    figure4 = parseInt(result) - parseInt(figure3)
    $('#keyup1').text(`¥${figure3}`);
    $("#keyup2").text(`¥${figure4}`);
    }
}
$(function() {
    $('#keyup').on('keyup', function() {
      update_field();
    });
  });
  $(function() {
    $('.listing-select-wrapper__box--select_1').click(function(){
      $(".edit_x").remove();
  });
});

});