# Split Django Models

Split Django generated models into separated files, with proper names, classes and imports.

## Usage

Generate your models:  
```bash
python3 manage.py inspectdb > models.py
```

Run the script:  
```bash
./split_django_models.sh models.py
```

Put them all into a folder so you can enjoy the step bellow:  

The script also creates a *\_\_init\_\_.py* file, so you can import them all at once:  
```python
from yourapp.models import *
```

Done!

## Buy me a coffee
[![Donations](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=victorqribeiro%40gmail%2ecom&lc=BR&item_name=Victor%20Ribeiro&item_number=donation&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHosted)
