(function(){
    var aps = Array.prototype.slice, toString = Object.prototype.toString;
    function isArray(value) {return toString.call(value) === '[object Array]';}
    function isFunction(value){return typeof value === 'function';}

    var lexer = function(){
        return {
            scan: scan,
            tokenize: function(input){ return tokenize(scan(input)); }
        };

        function symbol(type, input){ return { type: type, value: input } }

        function scan(input) { //分离出括号，字符串及单词
            return input.split('"').map(function(x, i){
                if (i % 2 === 0){ // not in string
                    return x.replace(/\(/g, ' ( ').replace(/\)/g, ' ) ');
                } else { // in string
                    return x.replace(/\s/g, "#whitespace#");
                }
            }).join('"').trim().split(/\s+/).map(function(x){
                return x.replace(/#whitespace#/g, " ");
            });
        }

        function tokenize(words) {
            return words.map(function(input){
                if (input === '(' || input === ')') {
                    return symbol('keyword', input);
                } else if (!isNaN(parseFloat(input))) {
                    return symbol('literal', parseFloat(input));
                } else if (input[0] === '"' && input.slice(-1) === '"') {
                    return symbol('literal', input.slice(1, -1));
                } else {
                    return symbol('identifier', input);
                }
            });
        }
    }();

    var parser = function(){
        return {
            parse: function(tokens){ return ast(tokens, []); },
            print: function(ast){ printAST(ast, 0); }
        };

        function ast(tokens, list) {
            var token = tokens.shift();
            if (token === undefined) {
                return list.pop();
            } else if (token.value === "(") {
                list.push(ast(tokens, []));
                return ast(tokens, list);
            } else if (token.value === ")") {
                return list;
            } else {
                return ast(tokens, list.concat(token));
            }
        }

        function printAST(node, i){
            var indent = '';
            for (var j = 0; j < i; j++){
                indent += "\t";
            }
            if (isArray(node)) {
                var op = node[0];
                console.log(indent, op.value);
                node.slice(1).forEach(function(e){
                    printAST(e, i + 1);
                });
            } else {
                console.log(indent, node.value);
            }
        }
    }();


    var interpreter = function(){
        var env = {};
        return {
            interpret: function(ast, scope){ return interpret(ast, scope); }
        };

        function execute(expr, scope) {
            var list = expr.map(function(e){ return interpret(e, scope); });
            if (isFunction(list[0])) {
                var ret = list[0].apply(scope, aps.call(list, 1));
                if (isArray(ret) && ret.length == 1) {
                    return ret[0];
                } else {
                    return ret;
                }
            } else {
                return list;
            }
        }

        function interpret(node, scope) {
            if (isArray(node)) {
                return execute(node, scope);
            } else if(node.type === 'identifier') {
                return scope.get(node.value);
            } else { //literal
                return node.value;
            }
        }
    }();

    var sanitize = function(args) {
        if (args.length == 1 && args[0] instanceof Array){
            return args[0];
        } else {
            return aps.call(args);
        }
    };

    var axiom = {
        quote: function(){
            return aps.call(arguments);
        },
        atom: function(s){

        },
        eq: function(x, y){
            return x === y;
        },
        car: function(){
            console.log("car -> ", arguments);
            return arguments[0];
        },
        cdr: function() {
            console.log("cdr -> ", arguments);
            return aps.call(arguments, 1);
        },
        cons: function(a, s){
            return [a].concat(s);
        },
        cond: function(expr){

        }
    };

    var env = function(scope, parent) {
        return {
            get: function(identifier){
                if (axiom.hasOwnProperty(identifier)){
                    return axiom[identifier];
                } else if (scope && scope.hasOwnProperty(identifier)) {
                    return scope[identifier];
                } else if (parent !== undefined) {
                    return parent[identifier];
                } else {
                    return undefined;
                }
            }
        };
    };





    var s = '(car (cdr (cdr (cdr 1 2) 3 4 5) 6) 7)';
    //var s = '(cdr (cdr 1 2) 3 4 5)';
    //console.log(lexer.scan(s));

    var tokens = lexer.tokenize(s);
    console.log(tokens);
    var ast = parser.parse(tokens);
    console.log();
    console.log(ast);
    parser.print(ast);




    console.log(interpreter.interpret(ast, env()));



    /*
    var s1 = '(car (cdr (quote "1  3" "2 6")) 5)'

    console.log(parse(s1));
    console.log(interpret(parse(s1)));
    console.log("--------------");

    var s2 = '(car (cdr (quote 1 2 3))';
    console.log(parse(s2));

    console.log(interpret(parse(s2)));
    */
})();