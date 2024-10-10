from django.db import models
from django.utils import timezone


class TimestampedModel(models.Model):
    """
    An abstract base class model that provides self-updating
    `created_at` and `updated_at` fields and a nullable `deleted_at` field.
    """
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    deleted_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        abstract = True

    def soft_delete(self):
        """
        Soft deletes the model by setting `deleted_at` to the current timestamp.
        """
        self.deleted_at = timezone.now()
        self.save()

    def restore(self):
        """
        Restores the model by setting `deleted_at` to None.
        """
        self.deleted_at = None
        self.save()

    def is_deleted(self):
        """
        Returns True if the model instance is soft deleted, False otherwise.
        """
        return self.deleted_at is not None

    def save(self, *args, **kwargs):
        """
        Override the save method to automatically update the `updated_at` field.
        """
        self.updated_at = timezone.now()
        super().save(*args, **kwargs)
