# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM python:2

# install system wide deps
RUN apt-get --no-install-recommends install -yqq update

# Set the work directory
RUN mkdir -p /usr/src
WORKDIR /usr/src

# Install git
##RUN sudo -E apt-get --no-install-recommends install -yqq install \
  ##git

# Clone Distill
RUN git clone https://github.com/apache/incubator-senssoft-distill.git distill
WORKDIR /usr/src/distill
RUN git pull


# Add code
##WORKDIR /app
##ADD setup.py /app

ADD requirements.txt /distill

# Install Distill dependencies
RUN pip install -r requirements.txt

# Expose Ports
EXPOSE 8090

# Rest
ADD . /app
RUN python setup.py develop
CMD python distill/server.py