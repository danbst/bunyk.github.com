# REQUIRE jquery
# REQUIRE exercises.coffee

$ = jQuery

$(()->
    $('.drag_exercise').each(()->
       $(this).dragExcercise()
    )
    $('.fill_exercise').each(()->
       $(this).fillExcercise()
    )
)
