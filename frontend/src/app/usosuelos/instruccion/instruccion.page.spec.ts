import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InstruccionPage } from './instruccion.page';

describe('InstruccionPage', () => {
  let component: InstruccionPage;
  let fixture: ComponentFixture<InstruccionPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InstruccionPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InstruccionPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
