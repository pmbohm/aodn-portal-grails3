<%--
  Created by IntelliJ IDEA.
  User: pmbohm
  Date: 2019-02-25
  Time: 10:45
--%>
import React from 'react';
import ReactDOM from 'react-dom';

%{--const config = {
    ui_config: Object.assign(
        JSON.parse(JSON.stringify(ui_config)),
        JSON.parse(JSON.stringify(ui_json_default))
    ),
};--}%

let newStore = createStore(reducers);
if (process.env.REACT_APP_DEV === "TRUE") {
    newStore = createStore(reducers, window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__());
}
const store = newStore;
export default store;

ReactDOM.render(
<Provider store={store}>
    <DEVL config={config}/>
</Provider>,
    document.getElementById('root')
);