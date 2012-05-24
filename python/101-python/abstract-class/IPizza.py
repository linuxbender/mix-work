#<git>
#    <project>python</project>
#    <author>daniel glenn</author>
#    <homepage>starwolf.ch</homepage>
#    <license>creativecommons.org/licenses/by-nc-sa/3.0/</license>
#    <descrition>Free code and work products</descrittion>
#    <history>15.10.2010 - init class</history>
#    <version>01</version>
#</git>
from abc import ABCMeta,abstractmethod

class IPizza(metaclass=ABCMeta):
    
    def __init__(self):
        self.__value = 0
    
    @abstractmethod
    def MakePizza(self):
        return print('make pizza')
    
    @abstractmethod
    def BackPizza(self):
        return print('Pizza in the oven')
    
    def BuildPizza(self):
        self.MakePizza()
        self.BackPizza()
