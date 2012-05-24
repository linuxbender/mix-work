#<git>
#    <project>python</project>
#    <author>daniel glenn</author>
#    <homepage>starwolf.ch</homepage>
#    <license>creativecommons.org/licenses/by-nc-sa/3.0/</license>
#    <descrition>Free code and work products</descrittion>
#    <history>15.10.2010 - init class</history>
#    <version>01</version>
#</git>

from CheesePizza import CheesePizza
from HamPizza import HamPizza

if __name__ == '__main__':
    #Cheese
    _oCheese = CheesePizza()
    _oCheese.BuildPizza()
    print("")
    # Ham
    _oHam = HamPizza()
    _oHam.BuildPizza()
