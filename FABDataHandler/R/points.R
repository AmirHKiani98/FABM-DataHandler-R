points <-
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
    hybrid_chain(eventFunc(), function(value) {
        if (ignoreInit && !initialized) {
            initialized <<- TRUE
            req(FALSE)
        }
        req(!ignoreNULL || !isNullEvent(value))
        isolate(valueFunc())
    })
})), class = c("reactive.event", "reactiveExpr", "reactive", 
"function"))
