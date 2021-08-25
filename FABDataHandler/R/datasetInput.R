datasetInput <-
structure(function () 
{
    .dependents$register()
    if (.invalidated || .running) {
        ..stacktraceoff..(self$.updateValue())
    }
    if (.error) {
        stop(.value)
    }
    if (.visible) 
        .value
    else invisible(.value)
}, observable = <environment>, cacheHint = list(userExpr = quote({
    switch(input$dataset, rock = rock, pressure = pressure, cars = cars)
})), class = c("reactiveExpr", "reactive", "function"))
