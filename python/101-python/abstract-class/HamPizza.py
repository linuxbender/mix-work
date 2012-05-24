#<git>
#    <project>python</project>
#    <author>daniel glenn</author>
#    <homepage>starwolf.ch</homepage>
#    <license>creativecommons.org/licenses/by-nc-sa/3.0/</license>
#    <descrition>Free code and work products</descrittion>
#    <history>15.10.2010 - init class</history>
#    <version>01</version>
#</git>

from IPizza import IPizza

class HamPizza(IPizza):
    
    def __init__(self):
        self._PizzaCrust = 0
    
    @classmethod
    def MakePizza(self):        
        print('make HamPizza')
        return self.__LotsOfHam()
    
    @classmethod
    def BackPizza(self):
        return print('HamPizza in the oven')
    
    #this is private
    @classmethod    
    def __LotsOfHam(self):
        print("lots of Ham on my pizza")
    
    # property example - thin pizza crust - yes is 1 - no is 0
    @property
    def PizzaCrust(self):        
        return self._PizzaCrust
    @PizzaCrust.setter
    def PizzaCrust(self,_value):
        self._PizzaCrust = _value
    
    @PizzaCrust.deleter
    def PizzaCrust(self):
        del self._PizzaCrust
