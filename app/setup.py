#!/usr/bin/env python

from setuptools import setup, find_packages

requires = [
    'picamera==1.8',
    'Flask==0.10.1',
    'Flask-Cors==1.10.1',
    'Pykka==1.2.0',
]


setup(
    name='rpi-cameraserver',
    version='1.0.0',
    author="Dag Einar Monsen",
    author_email="me@dag.im",
    package_dir={'': 'src'},
    packages=find_packages("src"),
    install_requires=requires,
    zip_safe=False,
)
