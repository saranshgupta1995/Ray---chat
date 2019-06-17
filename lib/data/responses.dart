final responsesData = {
  'hi': {
    'text': 'Hi, what can I help you with?',
    'type': 'text questions',
    'questions': [
      'How do I book a Ticket?',
      'I am unable to sign up',
      'I want to see my current bookings',
      'I want to cancel an existing booking',
    ]
  },
  'how do i book a ticket?': {
    'text': 'Please follow the steps at help.redbus.in',
    'type': 'text',
    'questions': []
  },
  'how do i cancel a ticket?': {
    'text': 'Let me help you through the flow',
    'type': 'text',
    'questions': []
  },
  'i am unable to sign up': {
    'text': 'Which step are you having trouble with?',
    'type': 'text questions',
    'questions': [
      'I am not getting an OTP on my number.',
      'I am not getting the email verification link.',
    ]
  },
  'i want to see my current bookings': {
    'text': 'Sure!',
    'type': 'text ticket',
    'questions': []
  },
  'i want to cancel an existing booking': {
    'text': 'Please choose a booking under your account',
    'type': 'text cancel',
    'questions': []
  },
  'i am not getting an otp on my number.': {
    'text': 'Please call us at 9876543210 with OTP 6546 to verify your number',
    'type': 'text final',
    'questions': []
  },
  'i am not getting the email verification link.': {
    'text': 'Please write to us at rbeconfirm@gmail.com verify your email account',
    'type': 'text final',
    'questions': []
  },
};
