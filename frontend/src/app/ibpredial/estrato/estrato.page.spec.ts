import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EstratoPage } from './estrato.page';

describe('EstratoPage', () => {
  let component: EstratoPage;
  let fixture: ComponentFixture<EstratoPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EstratoPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EstratoPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
