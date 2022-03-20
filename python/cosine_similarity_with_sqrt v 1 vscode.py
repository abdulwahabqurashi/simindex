import time 
start=time.time()



import gensim
import numpy as np
import nltk
from nltk.tokenize import sent_tokenize, word_tokenize
import csv
import re
#import pandas as pd
#from pandas import DataFrame
#import pandas as pd
nltk.download('punkt')



#Loading pre=trained word2vec model

from gensim.models.keyedvectors import KeyedVectors

# You need to dowload google pre-trained model using below link
# https://drive.google.com/file/d/0B7XkCwpI5KDYNlNUTTlSS21pQmM/edit
#Change the path according to your directory

model_path = 'D:\GoogleNews_vectors_negative300\GoogleNews_vectors_negative300.bin'   
w2v_model = KeyedVectors.load_word2vec_format(model_path, binary=True)



# Importing Source Rules or OCD Rulebook CSV file

with open ('Source rules or OCD rulebook.csv') as file_object:
    for OCDline in file_object:
        print(OCDline)



#Sentences tokenization of Source Rules or OCD Rulebook CSV file

target_rules = []
with open ('Source rules or OCD rulebook.csv') as file_object:
    for trainline in file_object:
        tokens_train = sent_tokenize(trainline)
        target_rules.extend(tokens_train)

    
# Searching for text that includes any digits or decimal number. "\d" is looking for digits in tokens

withdigits_target_rules=[s for s in target_rules if re.findall("^\d",s)]
print(withdigits_target_rules)



# Importing Target Rules or EA Rulebook CSV file

with open ('Target Rules or EA rulebook.csv') as file_object:
    for EAline in file_object:
        print(EAline)



#Sentences tokenization of Target Rules or EA Rulebook CSV file

source_rules = []
with open ('Target Rules or EA rulebook.csv') as file_object:
    for trainline in file_object:
        tokens_train = sent_tokenize(trainline)
        source_rules.extend(tokens_train)

        
# Searching for text that includes any digits or decimal number. "\d" is looking for digits in tokens


withdigits_source_rules=[s for s in source_rules if re.findall("^\d",s)]
print(withdigits_source_rules)



#Setting Parameters for model

class DocSim(object):
    def __init__(self, w2v_model , stopwords=[]):
        self.w2v_model = w2v_model
        self.stopwords = stopwords

    def vectorize(self, doc):
        """Identify the vector values for each word in the given document"""
        doc = doc.lower()
        words = [w for w in doc.split(" ") if w not in self.stopwords]
        word_vecs = []
        for word in words:
            try:
                vec = self.w2v_model[word]
                word_vecs.append(vec)
            except KeyError:
                # Ignore, if the word doesn't exist in the vocabulary
                pass

        # Assuming that document vector is the mean of all the word vectors

        vector = np.mean(word_vecs, axis=0)
        return vector


    def _cosine_sim(self, vecA, vecB):
        """Find the cosine similarity distance between two vectors."""
        csim=( np.dot(vecA,vecB) )/ (np.linalg.norm(vecA)*np.linalg.norm(vecB))
        if np.isnan(np.sum(csim)):
            return 0
        return csim

    def calculate_similarity(self, withdigits_source_rules, withdigits_target_rules=[], threshold=0.8):
        """Calculates & returns similarity scores between given source rules & all
        the target rules"""
        if isinstance(withdigits_target_rules, str):
            withdigits_target_rules = [withdigits_target_rules]


        source_vec = self.vectorize(withdigits_source_rules)
        results = []
        
        for rule in withdigits_target_rules:
            target_vec = self.vectorize(rule)
            sim_score = self._cosine_sim(source_vec, target_vec)
            if sim_score > threshold:
                results.append({
                    'Cosine Sim Score':sim_score,
                    'Target Rule':rule
                })

                
            # Sort results by score in desc order
            results.sort(key=lambda k : k['Cosine Sim Score'] , reverse=True)

        return results




ds = DocSim(w2v_model)


    #Calculate the similarity score between a source rule & a target rule.


if isinstance(withdigits_source_rules, str):
    withdigits_source_rules = [withdigits_source_rules]
   

# This will return one target rules text with a similarity score

for rule in withdigits_source_rules:
    sim_scores= ds.calculate_similarity(rule, withdigits_target_rules)

    
    
    # Source Rules are OCD Rules
    # Target Rules are EA Rules
    
    # Printing the output in text file
    
    print("Source rule: {} \n\nSimilarity with Target Rule is \n\n {}\n".format(rule, sim_scores) , file=open("output.txt", "a"))
    print("\n")
    
    
    # Printing output in Jupyter
    
    print("Source rule: {} \n\nSimilarity with Target Rule is \n\n {}\n".format(rule, sim_scores) )
    print("\n")



done=time.time()
elapsed=done-start
print(elapsed)
