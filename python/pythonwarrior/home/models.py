import datetime

from django.db import models
from django.utils import timezone

# Model News 
class News(models.Model):
    author = models.CharField(max_length=64)
    title = models.CharField(max_length=256)
    content = models.TextField()
    tags =  models.CharField(max_length=128)
    pub_date = models.DateTimeField('date published')
    created_at = models.DateTimeField(auto_now=True)
    update_at = models.DateTimeField(auto_now=True)
    
    
    def __unicode__(self):
        return u'%s %s %s %s %s %s %s ' % (self.author, self.title, self.content, self.tags, self.pub_date, self.created_at, self.update_at)
