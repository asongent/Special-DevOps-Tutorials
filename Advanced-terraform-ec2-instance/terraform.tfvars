                   
                        ////// KEY VARIABLE ////
# To create and downloads aws ec2-instance key_pay instantly, use the following commands below. 


                    //// For MacOS users ////
#  aws ec2 create-key-pair --key-name myKeypair --query 'KeyMaterial' --output text > mykeypair.pem

                ///// WINDOWS Users ///// --------> NB: This must be run on POWERSHELL as Admin user
# aws ec2 create-key-pair --key-name mykeypair --query 'KeyMaterial' --output text | out-file -encoding ascii -filepath mykeypair.pem

aws_access_key = "your_aws_access_key"

aws_secret_key = "your_aws_secret_key"

ssh_key_name = "mykeypair"

private_key_path = "/c/Users/user_name/Directory/mykeypair.pem"