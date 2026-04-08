# Install git first
RUN apt-get update && apt-get install -y git

# Clone django-fullcalendar manually into /app/src
RUN git clone https://github.com/rodrigoamaral/django-fullcalendar.git /app/src/django-fullcalendar

# Then install local package
RUN pip install --upgrade pip
RUN pip install /app/src/django-fullcalendar

# Install the rest of your requirements without django-fullcalendar
COPY requirements.txt .
RUN pip install --default-timeout=100 -r requirements.txt --no-deps
