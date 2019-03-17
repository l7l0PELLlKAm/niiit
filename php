
<?php


/**
 * @param $x
 * @return bool
 */
function isCorrect($x){
    if (strlen($x)%2 == 1){
        return false;
    }
    else {
        for ($i = 0; $i < strlen($x-1); $i++) {
            if (($x[$i] == '(' && $x[$i + 1] == ')') || ($x[$i] == '[' && $x[$i + 1] == ']') || ($x[$i] == '{' && $x[$i + 1] == '}')) {
                $i++;
            }
            elseif (strlen($x) == 0) {
                return true;
            } else {
                return false;
                break;
            }
        }
        return true;
    }

}

assert(isCorrect(''));
assert(isCorrect('()'));
assert(isCorrect('{}()[]'));

?>
