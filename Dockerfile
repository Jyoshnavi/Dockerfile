FROM centos:7

# Step 1 - Installing Git
RUN yum install -y git

#Step 2 - Installing Python
RUN yum install -y python

#Step 3 - Installing Java 11
RUN yum install -y java-11-openjdk

#Step 4 - Install OpenSSH
RUN yum install -y openssh-server

#Step 5 - Enable SSH access
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN ssh-keygen -A

#Step 6 - Adding environment variables to the JAVA(optional)
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
ENV PATH=$PATH:$JAVA_HOME/bin

# Set the working directory (optional)
WORKDIR /app

# Add your application files (if needed)
# Specify the default command to run when the container starts (optional)
CMD ["/bin/bash"]
