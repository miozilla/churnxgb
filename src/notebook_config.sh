  #!/bin/bash -e
  echo "STARTUP-SCRIPT: START"
  
  # Copy the notebook and requirements.txt files from the storage bucket
  sudo -u jupyter gsutil cp gs://qwiklabs-gcp-03-85ada7264597-labconfig-bucket/lab_exercise-v1.0.0.ipynb /home/jupyter/lab_exercise-v1.0.0.ipynb
  sudo -u jupyter gsutil cp gs://qwiklabs-gcp-03-85ada7264597-labconfig-bucket/requirements.txt /home/jupyter/
  # Install required python packages
  pip install --upgrade --no-warn-conflicts --no-warn-script-location -r /home/jupyter/requirements.txt
  cd ~ && cd /home/jupyter/
  jupyter nbconvert --clear-output --inplace lab_exercise-v1.0.0.ipynb
  echo "STARTUP-SCRIPT: END"
